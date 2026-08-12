<# Install and verify the versions pinned in tools.lock.json. #>
[CmdletBinding()]
param([switch]$Force)

$ErrorActionPreference = 'Stop'
$lock = Get-Content (Join-Path $PSScriptRoot 'tools.lock.json') -Raw | ConvertFrom-Json
if ($lock.schema_version -ne 1) { throw "Unsupported lock schema: $($lock.schema_version)" }

function Add-UserPath([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return }
    $parts = [Environment]::GetEnvironmentVariable('Path', 'User') -split ';'
    if ($parts -notcontains $Path) {
        [Environment]::SetEnvironmentVariable('Path', (($parts + $Path) -join ';').Trim(';'), 'User')
    }
    if (($env:PATH -split ';') -notcontains $Path) { $env:PATH += ";$Path" }
}

function Get-GoVersion([string]$Executable) {
    if (-not (Test-Path -LiteralPath $Executable)) { return $null }
    $line = & go version -m $Executable 2>$null | Where-Object { $_ -match '^\s*mod\s+' } | Select-Object -First 1
    if ($line -match '^\s*mod\s+\S+\s+(\S+)') { return $Matches[1] }
    return $null
}

function Get-PipVersion([string]$Python, [string]$Package) {
    $line = & $Python -m pip show $Package 2>$null | Where-Object { $_ -match '^Version:' } | Select-Object -First 1
    if ($line -match '^Version:\s*(.+)$') { return $Matches[1].Trim() }
    return $null
}

$go = Get-Command go -ErrorAction SilentlyContinue
if (-not $go) { throw 'Go is required: https://go.dev/dl' }
$goBin = Join-Path ((& $go.Source env GOPATH).Trim()) 'bin'
New-Item -ItemType Directory -Force -Path $goBin | Out-Null
Add-UserPath $goBin

foreach ($item in $lock.go.PSObject.Properties) {
    $name, $spec = $item.Name, $item.Value
    $exe = Join-Path $goBin "$name.exe"
    $current = Get-GoVersion $exe
    if ($Force -or $current -ne $spec.version) {
        & $go.Source install "$($spec.module)@$($spec.version)"
        if ($LASTEXITCODE) { throw "go install failed: $name" }
        $current = Get-GoVersion $exe
    }
    if ($current -ne $spec.version) { throw "${name}: expected $($spec.version), found $current" }
    Write-Host "[OK] $name $current"
}

$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) { $python = Get-Command py -ErrorAction SilentlyContinue }
if (-not $python) { throw 'Python is required.' }

foreach ($item in $lock.python.PSObject.Properties) {
    $name, $wanted = $item.Name, [string]$item.Value
    $current = Get-PipVersion $python.Source $name
    if ($Force -or $current -ne $wanted) {
        & $python.Source -m pip install --disable-pip-version-check --upgrade "$name==$wanted"
        if ($LASTEXITCODE) { throw "pip install failed: $name" }
        $current = Get-PipVersion $python.Source $name
    }
    if ($current -ne $wanted) { throw "${name}: expected $wanted, found $current" }
    Write-Host "[OK] $name $current"
}

$pythonExe = (& $python.Source -c 'import sys; print(sys.executable)').Trim()
Add-UserPath (Join-Path (Split-Path $pythonExe) 'Scripts')

$npm = Get-Command npm -ErrorAction SilentlyContinue
if (-not $npm) { throw 'Node.js with npm is required.' }
$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) { throw 'Node.js 18 or newer is required.' }
$nodeMajor = [int]((& $node.Source --version).TrimStart('v').Split('.')[0])
if ($nodeMajor -lt 18) { throw "Node.js 18 or newer is required; found $(& $node.Source --version)." }
$npmRoot = Join-Path $PSScriptRoot '.runtime/playwright-mcp'
foreach ($item in $lock.npm.PSObject.Properties) {
    $name, $wanted = $item.Name, [string]$item.Value
    $manifest = Join-Path $npmRoot "node_modules/$name/package.json"
    $current = if (Test-Path -LiteralPath $manifest) {
        [string]((Get-Content -Raw -LiteralPath $manifest | ConvertFrom-Json).version)
    } else { $null }
    if ($Force -or $current -ne $wanted) {
        & $npm.Source install --prefix $npmRoot --ignore-scripts --no-audit --no-fund --package-lock=false --save-exact "$name@$wanted"
        if ($LASTEXITCODE) { throw 'npm install failed.' }
        $current = [string]((Get-Content -Raw -LiteralPath $manifest | ConvertFrom-Json).version)
    }
    if ($current -ne $wanted) { throw "${name}: expected $wanted, found $current" }
    Write-Host "[OK] $name $wanted"
}

$env:PLAYWRIGHT_BROWSERS_PATH = Join-Path $PSScriptRoot '.runtime/playwright-browsers'
$playwrightCli = Join-Path $npmRoot 'node_modules/playwright/cli.js'
if (-not (Test-Path -LiteralPath $playwrightCli)) { throw 'Local Playwright CLI is missing.' }
& $node.Source $playwrightCli install chromium
if ($LASTEXITCODE) { throw 'Chromium installation failed.' }
$probe = 'const { chromium } = require(process.argv[1]); chromium.launch({ headless: true }).then(async b => { await b.close(); }).catch(e => { console.error(e); process.exit(1); });'
& $node.Source -e $probe (Join-Path $npmRoot 'node_modules/playwright')
if ($LASTEXITCODE) { throw 'Local Chromium launch check failed.' }
Write-Host '[OK] local Chromium'

foreach ($item in $lock.wordlists.PSObject.Properties) {
    $name, $spec = $item.Name, $item.Value
    $path = Join-Path $PSScriptRoot $spec.file
    if (-not (Test-Path -LiteralPath $path)) { throw "${name}: missing local asset" }
    $current = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($current -ne $spec.sha256) { throw "${name}: checksum mismatch" }
    $entries = (Get-Content -LiteralPath $path | Where-Object { $_.Trim() }).Count
    if ($entries -ne $spec.entries) { throw "${name}: expected $($spec.entries) entries, found $entries" }
    Write-Host "[OK] $name $($spec.version) ($entries entries)"
}

Write-Host 'Pinned toolchain verified.' -ForegroundColor Green

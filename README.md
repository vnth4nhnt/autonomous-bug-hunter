# Autonomous Bug Hunter
Prompt-based autonomous black-box web security testing workflow for authorized targets. Claude Code is the primary client; Codex uses the same kernel, skills, and agent contracts through `AGENTS.md`.

## Setup

Requires Claude Code or Codex, Go, Python, and Node.js 18+.

```powershell
powershell -ExecutionPolicy Bypass -File .\install-tools.ps1
```

Approve the project MCP servers in Claude Code or trust the project in Codex once. The installer pins the CLI tools, Playwright MCP, local Chromium, and the sensitive-file wordlist.

## Run

Open this project at its root, replace `<NAME>` and `<SCOPE_FILE>` in `prompt.txt`, then send the prompt to Claude Code or Codex. Keep authorization material and all engagement output under `engagements/<name>/knowledge-base/`.

## Structure

- `CLAUDE.md`: operating kernel and completion conditions.
- `.claude/skills/`: recon, extraction, hunting, validation, and reporting methods.
- `.claude/agents/`: delegated role contracts.
- `AGENTS.md`: Codex bridge.
- `tools.lock.json` and `install-tools.ps1`: reproducible tooling.

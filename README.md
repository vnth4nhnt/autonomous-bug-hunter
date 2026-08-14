# Autonomous Bug Hunter
Prompt-based autonomous evidence-adaptive web security testing workflow for authorized targets. It follows security decisions and value flows through recon, source/runtime/schema-assisted extraction, hypothesis-driven hunting, independent validation, reporting, and audited closure. Claude Code is the primary client; Codex uses the same kernel, skills, and agent contracts through `AGENTS.md`.

## Setup

Requires Claude Code or Codex, Go, Python, and Node.js 18+. Install the project-local toolchain once:

```powershell
powershell -ExecutionPolicy Bypass -File .\install-tools.ps1
```

Approve the project MCP servers in Claude Code or trust the project in Codex once. Engagements assume the project-local toolchain is available.

## Run

Open this project at its root, replace `<NAME>` and `<SCOPE_FILE>` in `prompt.txt`, then send the prompt to Claude Code or Codex. Keep authorization material and evidence under `engagements/<name>/knowledge-base/`; private fixture state stays in the gitignored `engagements/<name>/.secrets/`.

Each run maintains a concise `surface-inventory.md` table of discovered user interactions and API/message operations by domain, endpoint, method/action, params, body/message, authentication, and authorization.

## Structure

- `CLAUDE.md`: operating kernel and completion conditions.
- `.claude/skills/`: recon, extraction, hunting, validation, and reporting methods.
- `.claude/agents/`: delegated role contracts.
- `AGENTS.md`: Codex bridge.
- `tools.lock.json` and `install-tools.ps1`: reproducible tooling.

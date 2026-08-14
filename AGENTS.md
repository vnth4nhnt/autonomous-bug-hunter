# BugHunter - Codex bridge

Read `CLAUDE.md` completely before task actions and treat it as the canonical operating kernel.

When the kernel invokes a skill, read the matching `.claude/skills/<name>/SKILL.md`. Skills are methods, not independent workers. Keep orchestration, identity fixtures, surface extraction and reporting inline. Before delegation, load the exact role contract and method: `.claude/agents/recon-agent.md` plus `recon-pipeline`; `.claude/agents/deep-hunt-agent.md` plus `deep-hunting`; `.claude/agents/validator-agent.md` plus `finding-validation`; or `.claude/agents/coverage-auditor.md` plus only the skill contracts needed for the queues under audit. Pass only evidence allowed by the role.

Codex platform mechanics do not change scope, active boundary, traffic ownership, harm ceilings, evidence standards, independent validation, coverage, or reporting gates. Treat those as invariants and adapt evidence source, tool and ordering when a better semantics-preserving strategy exists. Keep all BugHunter state inside this project.

Default to direct semantic review of primary evidence. Do not create a `.ps1`, `.py`, `.js`, `.ts`, `.sh` or other executable helper for an engagement-specific or one-off task; use existing tools or an attached inline command for mechanics and inspect the underlying evidence yourself. A committed helper must pass the narrow script-creation gate in `CLAUDE.md`.

Run the kernel's five queues through their terminal invariants. Keep `surface-inventory.md` as the interaction projection, `surfaces.md` as the canonical security-decision graph and HUNT source, and the other current-state records synchronized by exact ids. Audit and reporting send no target traffic and never repair shared state: audit writes only its shard, reporting emits only gated output, and every auditor `REOPEN` returns to its owning queue. Pause only at the kernel's exact `WAITING-ON-OPERATOR` condition.

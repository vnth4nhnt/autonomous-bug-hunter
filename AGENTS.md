# BugHunter - Codex bridge

Read `CLAUDE.md` completely before task actions and treat it as the canonical operating kernel.

When the kernel invokes a skill, read the matching `.claude/skills/<name>/SKILL.md`. Skills are methods, not independent workers. Keep orchestration, identity fixtures, surface extraction and reporting inline. Before delegation, load the exact role contract and method: `.claude/agents/recon-agent.md` plus `recon-pipeline`; `.claude/agents/deep-hunt-agent.md` plus `deep-hunting`; `.claude/agents/validator-agent.md` plus `finding-validation`; or `.claude/agents/coverage-auditor.md` plus only the skill contracts needed to audit the sampled queues. Pass only evidence allowed by the role.

Codex platform mechanics do not change scope, harm ceilings, evidence standards, independent validation, coverage, or reporting gates. Keep all BugHunter state inside this project.

Once an engagement has scope and required private prerequisites, run the five continuous queues and autonomous execution contract in `CLAUDE.md` through their terminal invariants. Every in-scope testable canonical surface stays queued until bounded risk-relevant hunting covers it and no severity-changing axis remains open. Never replace execution with an opt-in offer; agent returns and phase boundaries are checkpoints, not stopping points. Pause only in `WAITING-ON-OPERATOR` when progress genuinely requires operator interaction or factual input available only from the operator.

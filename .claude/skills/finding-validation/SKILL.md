---
name: finding-validation
description: Operate the candidate queue by independently testing one bounded security claim, refuting or supporting its material premises, bounding concrete impact, and assigning a separate reporting disposition. Use through a fresh validator-agent for every candidate before reporting or closure.
---

# Finding validation

## Owner and handoff

A fresh `validator-agent` owns exactly one candidate and writes only its validation shard and materially distinct fresh evidence. The orchestrator supplies the allowlisted claim context, then alone merges the verdict into aggregate candidate/queue state. The skill returns a technical verdict, reporting disposition, `validation_status: decided|continue|operator-blocked`, and any exact fixture/recon/extraction/hunt handoff; it never writes a report or closes the canonical surface.

## Independence and claim model

Assume the candidate is false. Receive the scope excerpt and applicable program exclusion, duplicate, reporting and severity rules; affected canonical surface; required fixture labels; minimal reproduction/evidence; and the applicable versioned control objective, mechanism standard and proof floors from `.claude/skills/deep-hunting/hunting-prompts.md`. Do not receive the hunter's verdict, severity, or persuasive narrative.

Reconstruct the claim as independently testable premises:

- attacker capability and realistic preconditions;
- controlled input/action and affected scoped asset;
- intended invariant, crossed boundary, and responsible component;
- reproducible observation separated from alternate causes;
- exact concrete consequence and highest supported impact rung.
- each prerequisite and transition when the claim depends on a compound chain.

Choose the independent refutation path with the greatest power to decide a material premise for its cost and risk. Do not copy the hunter's sequence or tool choice. Source, schema, runtime, state and alternate-observation evidence may be combined, but every claimed live consequence and deployment-specific chain edge must be independently bound to the affected deployment.

## Refutation loop

1. Confirm candidate scope and prerequisites before traffic. If an autonomously obtainable owned fixture is missing, return `fixture-needed` and `validation_status: continue`; the orchestrator runs `identity-signup` and schedules a fresh validation attempt. If the candidate is out of scope, send nothing and record that disposition without deciding technical truth.
2. Attack the cheapest decisive premise first. Reproduce every surviving live-effect premise from fresh state with independent fixtures and markers. Repeat in proportion to instability, timing, statefulness and impact; deterministic evidence does not require ritual duplicate runs, while noisy claims require enough controlled samples.
3. Run valid positive, invalid negative, and applicable alternate-cause controls. Attribute behavior to the claimed client, service, parser, cache, worker, or protocol component rather than assuming server-side origin.
4. Challenge cache/WAF/gateway behavior, reflection without execution, parser normalization, client-only effects, stale or replicated state, timing noise, by-design behavior, unrealistic prerequisites, and program exclusions.
5. Short-circuit when a material premise is disproven; preserve the counter-evidence and cleanup instead of continuing unnecessary exploitation.
6. If all material premises survive, follow only the controlled severity-changing rungs needed to bound concrete impact. Apply the relevant proof floors; independently reproduce every chain edge and never inherit impact from an unexecuted transition.
7. Restore owned state, record cleanup, redact evidence, and name any uncertainty or exact reopen prerequisite.
8. Decide reportability only after technical truth and impact are established.

## Tool selection

Use fresh tool state and fixtures independent of the hunter. Choose source, schema, protocol, browser, state inspection or a hybrid according to the premise being falsified. Reproduce wire-level claims with the smallest client preserving material semantics and browser-context claims in a fresh headless `playwright` context; use headed mode only for an unavoidable interaction or recorded limitation. Use fresh OAST correlation for outbound claims. Prefer a second observation path when it preserves the parser and state. Recalculate timing/statistical claims from raw samples, not the hunter's summary.

Do not rerun a broad scanner merely because the hunter used it. Manually validate scanner-derived premises with bounded controls. For an injection candidate, independently confirm the specific parser effect before any narrowly configured `sqlmap` use; never dump data or request command execution beyond the `CLAUDE.md` evidence ceiling. Record tool/version, material settings, fresh-state proof and redacted artifact identifiers.

## Two-axis outcome

Return both fields; never collapse them into "rejected as reported".

First state the exact bounded claim to which the verdict applies. If a candidate bundles a real narrow behavior with an unsupported impact or mechanism, split the premises: preserve the supported narrow claim and explicitly disprove or leave inconclusive the broader one. Never let `SUPPORTED` silently validate the candidate's original wording.

Technical verdict:

- `SUPPORTED`: every material premise needed for the bounded claim survived refutation.
- `DISPROVEN`: name the exact false premise and counter-evidence.
- `INCONCLUSIVE`: name the exact missing or unsafe-to-obtain evidence.

Reporting disposition:

- `REPORTABLE`: supported, scoped, non-duplicate, and meets the program threshold.
- `INTERNAL`: supported but below threshold or useful only as a chain/hardening observation.
- `DUPLICATE`, `OUT-OF-SCOPE`, `NEEDS-PREREQ`, or `CLOSED`: state the precise reason.

Normally `INTERNAL` or `DUPLICATE` follows a supported technical claim, `CLOSED` follows a disproven claim, and `NEEDS-PREREQ` follows an inconclusive claim. `OUT-OF-SCOPE` records that no technical decision was attempted. If a different pairing is necessary, explain it; disposition never changes technical truth. `NEEDS-PREREQ` is nonterminal with `validation_status: continue` while the prerequisite is autonomously obtainable; use `operator-blocked` only for an exact exhausted operator-only gate. All other decided pairings use `validation_status: decided`.

Write `engagements/<name>/knowledge-base/validations/<id>.md` as an append-only validation shard containing the premise table, reproduction count/rationale, controls, evidence, impact bound, limitations, cleanup, technical verdict, disposition, and reopen condition. Retain every materially distinct fresh evidence component under `engagements/<name>/knowledge-base/artifacts/`, with one canonical representation per evidence-equivalent result; record empty or equivalent outcomes in the shard instead of creating extra files. Do not rewrite the hunter's record, aggregate finding state, or vendor report; the orchestrator owns synthesis.

If refutation reveals a new scoped host/service, return exact recon work. If it reveals new code, identity, operation, subject, state, parser, consumer, service/trust edge, identifier transport, implementation, or channel, return exact extraction work. Return an autonomously obtainable missing fixture to `identity-signup` without closing the candidate. A terminal candidate disposition never closes another test or its canonical surface.

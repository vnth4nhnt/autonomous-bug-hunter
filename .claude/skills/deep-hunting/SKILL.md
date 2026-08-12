---
name: deep-hunting
description: Hunt one canonical web attack surface from observed behavior through every applicable OWASP WSTG v4.2 test and high-value target-specific hypothesis, using controlled evidence and bounded impact escalation. Use after attack-surface extraction has grounded the operation, boundary, fixtures, controls, and runtime seed.
---

# Deep hunting

## Owner and input

The orchestrator may run this skill inline or assign one canonical surface/flow to one `deep-hunt-agent`. Never give two owners the same surface or output path. Consume the surface record, scope rule, observed happy path, roles/states, JavaScript provenance or source-to-sink trace, fixtures, prior tests, limits, and proposed WSTG plan. Return `continue`, `reopen-recon`, `reopen-extraction`, `candidate`, `surface-tested-bounded`, `dedup`, or `blocked`; only the orchestrator changes shared queues.

If the surface, attacker, protected object/state, boundary, invariant, valid control, or oracle is not grounded, return the exact recon, extraction, or fixture prerequisite. Do not invent target behavior.

## Per-surface loop

1. Build the applicability plan from the versioned OWASP WSTG v4.2 categories in `hunting-prompts.md`. Record each applicable test id/category and why; record an evidence-backed reason for each relevant category marked `not-applicable`. Existing recon/extraction/test evidence may satisfy a case only when it proves the same objective and canonical decision for the same material role/state/channel with the required controls; otherwise reuse it only as a seed.
2. Order applicable tests by credible impact and prerequisites, without starving the remainder. Before each batch state: scope rule, surface, WSTG id or `TARGET-SPECIFIC`, hypothesis/invariant, attacker, fixtures, controls, oracle, request/rate/harm bound, cleanup, and stop/pivot condition.
3. Start from an observed valid transaction or browser flow. Run the smallest experiment that can distinguish the hypothesis, with a fresh positive control, a boundary-respecting negative control, and applicable alternate-cause controls. Preserve authentication, sequence, signatures, content type, origin, and other coupled semantics unless the test specifically changes them.
4. Use targeted request, value, state, role, tenant, channel, parser, timing, or concurrency variation only when the WSTG objective or target model calls for it. Compare complete response/message, browser behavior, durable before/after state, and downstream effects; a status code or scanner verdict is not a conclusion.
5. Minimize a signal, interleave controls, repeat with clean state in proportion to noise and consequence, and rule out WAF/gateway, cache/CDN, normalization, stale state, retry, client-only effects, rate limits, and jitter. Build the shortest controlled evidence ladder to the highest credible scoped consequence without crossing `CLAUDE.md` ceilings.
6. Route discoveries immediately: a new scoped host/service to recon; new JavaScript, operation, role/state, message, parser, consumer, or channel to extraction; a reproducible material failed-boundary premise to the candidate queue. Candidate creation never closes the test or surface and requires independent validation.
7. After applicable WSTG tests, run the model-grounded target-specific extensions in `hunting-prompts.md` that WSTG does not adequately cover. Avoid generic payload lists and repeated cosmetic variants.
8. Give every applicable test one terminal result: `tested-bounded`, `candidate`, evidence-backed `not-applicable`, `dedup`, or `blocked`, with evidence and an exact reopen condition. The surface is `surface-tested-bounded` only when all applicable tests and credible severity-changing target-specific hypotheses are terminal.

## Tool routing

- Use project `playwright` headlessly for normal authenticated flows, network capture, client execution, storage, navigation, workers, WebSockets, downloads, and multi-user state. Use `playwright-headed` only for unavoidable operator interaction or a recorded headless limitation after one controlled retry; finish that interaction and return to headless.
- Use the smallest semantics-preserving protocol client for exact replay or sequencing when browser context is unnecessary. If it cannot preserve secrets or protocol state, keep the test in the browser or mark that path blocked.
- Start `interactsh-client -json -o <artifact>` before a justified blind/outbound test and use a fresh marker per case; a callback proves outbound reachability only.
- Use `sqlmap` only after a manual differential identifies a specific injectable parameter/parser. Limit technique, level, risk, and proof; never crawl, dump data, or request a shell.
Record tool/version, material options, fixture labels, exact action/request ids, timestamps, raw redacted evidence, and cleanup. Keep secrets tool-managed.

## Record and return

Append one row per test to `engagements/<name>/knowledge-base/tests/<surface>.md`: id, surface, WSTG id/category or target-specific hypothesis, applicability, attacker/preconditions, invariant, seed/variation, controls/oracle, observation, alternate causes, bounded conclusion/status, evidence, demonstrated impact rung, cleanup, and reopen condition. Store redacted captures under `artifacts/`; propose a candidate file only at the candidate gate.

Return surface/assignment id; WSTG applicability plan; tests and terminal results; target-specific hypotheses/results; evidence and cleanup; candidate proposals; new recon/extraction work; remaining executable tests; blockers/reopen conditions; and exactly one return state. Never self-validate, assign final severity/reportability, or claim safety beyond the tested role/state/channel boundary.

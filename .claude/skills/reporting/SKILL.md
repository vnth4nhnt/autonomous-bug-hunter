---
name: reporting
description: Convert a SUPPORTED and REPORTABLE validation into an evidence-faithful vendor report with a fixed schema, or produce the bounded engagement summary only after an engagement-wide BOUNDED-PASS. Use inline by the orchestrator immediately after validation or at final audited closure; never use it to repair missing evidence.
---

# Reporting

## Owner and handoff

The orchestrator runs this skill inline from terminal validation/audit records; no reporting agent sends target traffic or reinterprets unsupported evidence. A finding draft returns control to the scheduler with other queues unchanged. The engagement summary is a closure artifact, not permission to submit; only the operator moves a reviewed draft to ready/submitted state.

## Gate

Draft a vendor finding only when validation returns `SUPPORTED + REPORTABLE`. Read the validation premise table, raw reproduction evidence, scope and program rules, and cleanup record. If scope, attribution, reproducibility, impact, or another material claim remains unresolved, do not draft: enqueue the exact validation prerequisite and continue the autonomous scheduler's other work.

Draft a validated high-impact finding promptly while independent hunting continues. Automation must never mark a report ready or submit it.

## Tool use

Read only the validator-supported premises and cited redacted artifacts. Use local search, file inspection and diffing to trace every material sentence; do not send new target traffic while reporting. Treat a CVSS calculator as arithmetic assistance only and verify every metric against the validated prerequisites and impact. Before handoff, mechanically check heading order, ASCII-only bytes, missing placeholders and accidental secrets; reopen validation instead of repairing missing evidence in prose.

## Output contract

- Write the entire output in ASCII. Permit only tab, carriage return, line feed, and characters U+0020 through U+007E. Replace Unicode punctuation with ASCII equivalents. Represent necessary non-ASCII evidence with an escaped byte form or a concise ASCII description without changing its meaning.
- Do not hard-wrap text to a column width. Keep each paragraph, list item, classification field, command, URL, and request or response line on one physical line. Add line breaks only at Markdown structure or semantic protocol boundaries.
- Use plain Markdown. Do not use tables, decorative separators, icons, or Unicode bullets.
- Preserve secrets with explicit ASCII placeholders such as `<ATTACKER_SESSION>`, `<TARGET_ID>`, and `<CALLBACK_URL>`.
- Use exactly the vendor-facing structure below, in the stated order. Do not add top-level sections.

```markdown
# <Specific vulnerability title>

## Classification

- Severity: <Critical|High|Medium|Low>
- CVSS 3.1: <score> (<full vector beginning CVSS:3.1/...>)
- CWE: <CWE-ID - ASCII name>
- Vulnerability type: <specific class>
- Affected asset: <scoped asset or component>

## Summary

<Concise description of the attacker, prerequisite, affected boundary or component, observed behavior, expected behavior, and demonstrated consequence.>

## Steps to Reproduce

Prerequisites: <minimum accounts, roles, fixtures, and state required>

1. <Exact controlled action.>
2. <Exact controlled action.>
3. <Observed result and the evidence that proves it.>

Cleanup: <Owned state restored or removed, verification performed, and any operator-owned cleanup still required.>

## Impact

<Concrete demonstrated confidentiality, integrity, availability, or privilege consequence, including the affected victim or asset and the proven scope. State material limitations here when they bound impact.>

## Remediation

<Practical mechanism-specific fix at the failed trust decision, plus the checks needed across equivalent routes, versions, roles, states, or downstream consumers when evidence shows they are relevant.>
```

## Classification rules

- Derive every CVSS 3.1 metric from validated attacker prerequisites and demonstrated impact. Include both the numeric score and the complete vector. Do not raise the score based on a speculative chain or an unvalidated worst case.
- Select the narrowest CWE supported by the demonstrated mechanism. Do not claim a root-cause CWE when only the external behavior is known.
- If the evidence cannot support a required classification, write `CVSS 3.1: Not assigned - <missing premise>` or `CWE: Not assigned - <missing mechanism evidence>` and keep the report in draft status.
- Keep severity consistent with the CVSS score and the program's published severity policy. If they differ, state the program severity in the field and explain the mapping briefly in the Summary.

## Content rules

- Make the title specific to the weakness, action, asset, and consequence. Do not use vague titles such as `Authorization issue`.
- In the Summary, state what an attacker can do, under which prerequisite, across which trust boundary, and what was actually observed. State the expected invariant. Label a root-cause inference explicitly or omit it.
- In Steps to Reproduce, include only the minimum repeatable sequence. Use owned fixtures, stable identifiers, exact endpoints and methods, relevant request data, required state transitions, and a decisive oracle. Include negative or positive controls only when needed to distinguish the vulnerability from normal behavior. End with the verified cleanup status without adding another top-level section.
- Keep request and response excerpts minimal while preserving the lines that prove identity, authorization context, target binding, state change, or returned data. Do not include unrelated headers, credentials, tokens, personal data, or internal agent notes.
- In Impact, describe only the demonstrated consequence and its supported ceiling. Do not add hypothetical blast radius, chained compromise, victim assumptions, persistence, RCE, tenant takeover, or data classes that validation did not prove.
- In Remediation, address the failed authorization, validation, state, parser, capability, or trust decision as close as possible to the enforcement point. Avoid generic advice such as `sanitize input`. Do not invent implementation details.
- Ensure every material sentence traces to validator-supported premises or raw evidence. Exclude rejected theories, speculative payloads, validation history, and confidence theater from the vendor report.

Write drafts to `engagements/<name>/knowledge-base/REPORT-DRAFTS/<finding-id>.md`. Only the operator may move a reviewed draft to `engagements/<name>/knowledge-base/READY-TO-SUBMIT/`.

## Engagement summary

Produce a separate engagement summary only after the engagement-wide auditor returns `BOUNDED-PASS`; a local host/application pass never satisfies this gate. Apply the same ASCII-only and no-hard-wrap rules. State the audited scope, roles and states actually exercised, supported findings and dispositions, meaningful negative conclusions, blockers, unowned gaps, residual uncertainty, and reopen conditions. Never convert endpoint counts, percentages, or absence of findings into assurance.

Store the engagement summary at `engagements/<name>/knowledge-base/engagement-summary.md`, not `knowledge-base/READY-TO-SUBMIT/`. Preserve validation history and internal observations in the knowledge base, never in vendor reports.

---
name: identity-signup
description: Autonomously resolve an owned identity, mailbox, role, tenant, session, lifecycle-state or object prerequisite for authorized extraction, hunting or validation. Use as soon as a material queue action needs a fixture, before marking it blocked, and whenever an existing fixture expires or loses its required state.
---

# Identity fixtures

## Objective

Treat fixtures as ordinary queue work. When a public flow can create the required account, mailbox, tenant, session, state or owned object, create and use it autonomously; never stop merely because the operator did not supply one.

## Derive the minimum fixture

Name the subject, tenant, role, lifecycle state, credential type, owned object and positive/negative control the fixture enables. For federation also name the in-scope relying party, normal issuer/client/tenant, callback, account-link state and session outcome. Avoid speculative account matrices, but create multiple accounts or tenants when the exact horizontal, vertical or cross-tenant boundary requires them.

## Acquisition

Follow this acquisition ladder without asking the operator: reuse a suitable live fixture; use an available mailbox integration; otherwise create an inbox through the normal API or headless web flow of a public disposable-mail service; if that path is unavailable or rejected, try an independent normal provider or target-supported signup route. A public temporary inbox controlled by the current tool session is an owned disposable fixture, not an operator prerequisite. Do not reject it merely because it is public or short-lived; honor an explicit program prohibition or target-side disposable-domain policy, then continue the ladder.

Complete the target's normal public signup with generated fictional data. Poll the selected inbox only for the bounded verification window, match the intended recipient and target sender/domain, extract only the required link or OTP, and submit it through the target's normal flow. Do not inspect unrelated mail or test the mailbox provider. Public accounts and inboxes are expendable: create as many as evidenced cross-user, role or tenant controls require, use unique random credentials, and never use real PII, customer data or reused secrets.

If the signup entry is unknown, inspect the existing route/runtime/API ledger and public navigation before concluding it is absent; return an exact extraction question when discovery remains unresolved. A missing visible button is not evidence that self-registration does not exist. Feed every newly observed signup/login/recovery route, request field, header, redirect, token transition and resulting capability back to extraction, with secrets redacted.

Use external mailbox, SSO, payment and transit services only through their normal user flows; do not test them or evade an explicit anti-abuse decision. Require the operator only for authority or facts unavailable to the system, paid/private eligibility, KYC, staff/domain approval, payment approval, or a human-only gate that available tools cannot complete normally.

## Provisioning loop

1. Inventory current fixtures by observed capability rather than role label.
2. Complete signup, email verification, login and required state transitions in headless mode. Generate expendable credentials inside the capable browser/tool context and retain the authenticated session rather than exposing raw values in prompts or shell arguments. Use headed mode only for a real headless limitation or operator interaction.
3. Create the minimum accounts, tenants, invitations and owned objects needed for positive, negative, cross-user, cross-role and cross-tenant controls.
4. If one legitimate path fails, classify the cause and continue the acquisition ladder. Do not return `blocked` for a missing mailbox tool, one failed provider, disposable-domain rejection or missing operator email while another normal autonomous path remains.
5. Return the fixture to the requesting queue immediately and keep its authenticated context alive while dependent work remains. Keep dependent work inline unless its assigned owner can use that same tool-managed context without receiving a raw secret.

## Secret handling

Keep passwords, cookies, tokens, mailbox access URLs, verification values and browser storage inside the capable tool context. Do not copy them into prompts, records, reports or agent messages; redact retained captures.

## Record and return

Record only opaque fixture label; mailbox/credential kind; acquisition steps and bounded failure classes without access URLs; tenant/membership; claimed role and observed capabilities; owned object ids; authentication realm/channel; lifecycle events; valid assets; expiry; disposition; blocker; and cleanup owner in `engagements/<name>/knowledge-base/identities.md`.

Retire disposable accounts, sessions and objects where the product permits it, and verify cleanup. When deletion is unavailable, log out/revoke what the product supports and record the inert retained fixture plus cleanup owner/reopen trigger; do not make closure impossible by claiming deletion occurred.

Return the requesting queue and canonical id, satisfied requirement, opaque fixture labels, observed capabilities, owned objects, remaining prerequisite, expiry/reopen condition, cleanup state, and exactly one `acquisition_status`: `satisfied`, `continue`, or `operator-blocked`. Use `satisfied` only when the requesting action can now run; use `continue` while another normal acquisition action remains; use `operator-blocked` only for the exact exhausted operator-only gate. Never return raw credentials or mailbox contents.

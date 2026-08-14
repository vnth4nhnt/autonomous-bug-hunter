---
name: identity-signup
description: Autonomously create or restore an owned identity, mailbox, role, tenant, session, lifecycle state or object for authorized extraction, hunting or validation. After fast recon, use it as the first action when an active host/application boundary has a grounded permitted public self-registration path; also use it whenever a material queue action needs another fixture, before marking it operator-blocked, or when an existing fixture expires or loses required state.
---

# Identity fixtures

## Objective

Treat fixtures as ordinary queue work. When a permitted public flow can create an account, mailbox, tenant, session, state or owned object, create and use it autonomously; never stop merely because the operator did not supply one. Public self-registration is an eager trigger: record it during recon, then prewarm one minimum verified account/session as soon as its host/application boundary becomes active and return it to authenticated extraction before hunting. Reuse that fixture across compatible work; additional identities remain demand-driven by exact controls.

## Derive the minimum fixture

Name the requesting graph, hunt or validation item; subject, tenant, role, lifecycle state, credential type, owned object and positive/negative control the fixture enables. For an eager signup, the requester is the grounded registration/authenticated-reachability graph item and the minimum fixture is one verified account plus retained session. For federation also name the in-scope relying party, normal issuer/client/tenant, callback, account-link state and session outcome. Avoid speculative account matrices, but create multiple accounts or tenants when the exact horizontal, vertical or cross-tenant boundary requires them.

## Acquisition

Follow this acquisition ladder without asking the operator: reuse a suitable live fixture; use an available mailbox integration; otherwise create an inbox through the normal API or headless web flow of a public disposable-mail service; if that path is unavailable or rejected, try an independent normal provider or target-supported signup route. A public temporary inbox controlled by the current tool session is an owned disposable fixture, not an operator prerequisite. Do not reject it merely because it is public or short-lived; honor an explicit program prohibition or target-side disposable-domain policy, then continue the ladder.

Complete the target's normal public signup with generated fictional data. Poll the selected inbox only for the bounded verification window, match the intended recipient and target sender/domain, extract only the required link or OTP, and submit it through the target's normal flow. Do not inspect unrelated mail or test the mailbox provider. Public accounts and inboxes are expendable: create as many as evidenced cross-user, role or tenant controls require, use unique random credentials, and never use real PII, customer data or reused secrets.

If the signup entry is unknown, inspect the existing route/runtime/API ledger and public navigation before concluding it is absent; return an exact extraction question when discovery remains unresolved. A missing visible button is not evidence that self-registration does not exist. Feed every newly observed signup/login/recovery route, request field, header, redirect, token transition and resulting capability back to extraction, with secrets redacted.

Use external mailbox, SSO, payment and transit services only through their normal user flows; do not test them or evade an explicit anti-abuse decision. Require the operator only for authority or facts unavailable to the system, paid/private eligibility, KYC, staff/domain approval, payment approval, or a human-only gate that available tools cannot complete normally.

## Provisioning loop

1. Inventory current fixtures by observed capability rather than role label.
2. Complete signup, email verification, login and required state transitions in headless mode. Generate expendable credentials inside the capable browser/tool context, persist the reusable registration and recovery material under the fixture's private secret path, and retain the authenticated session without exposing raw values in prompts or shell arguments. Use headed mode only for a real headless limitation or operator interaction.
3. Create the minimum accounts, tenants, invitations and owned objects needed for positive, negative, cross-user, cross-role and cross-tenant controls.
4. If one legitimate path fails, classify the cause and continue the acquisition ladder. Do not return `operator-blocked` for a missing mailbox tool, one failed provider, disposable-domain rejection or missing operator email while another normal autonomous path remains.
5. Save the current browser storage state immediately after signup/login and after every credential, token or session rotation. Return the fixture to the requesting queue immediately, reopen extraction for the authenticated route/state and keep its authenticated context alive while dependent work remains. Keep dependent work inline unless its assigned owner can use that same tool-managed context without receiving a raw secret.

## Secret handling and restart

Use one compact machine-only directory per fixture: `engagements/<name>/.secrets/<fixture-label>/`. Store reusable registration and recovery material in `fixture.json` with short stable keys for version, fixture label, submitted fictional registration/profile/recovery fields, login/email, password, mailbox address/access/secret, MFA seed or recovery codes, auth realm and timestamps. Store cookies and local storage in `storage-state.json`; store session storage separately only when the application materially depends on it. Keep raw values, not prose, and update in place after rotation. Delete a consumed OTP or verification link immediately; retain an unused recovery code or durable mailbox access because it can restore the account.

With project Playwright MCP, call `browser_storage_state` into the fixture directory after authentication and `browser_set_storage_state` from that file on resume or context switch. Capture and restore material session-storage keys and any other application auth state omitted by storage state with the capable browser tools when needed. At start, resume or compaction, try the saved storage state first, then saved credentials, then normal recovery through the saved mailbox, and create another account only after those reusable paths fail or an exact independent identity is required. Apply owner-only filesystem permissions where supported. The directory is already gitignored and is never evidence.

Only inline orchestration or the capable browser/tool context may read these files. Never print, summarize, hash into evidence, copy to an artifact, place in a shell argument, or send raw values to another agent or the user; redact any accidental capture immediately.

## Record and return

Record the exact FIXTURE item id, requester, state and next action/reopen trigger plus opaque fixture label and relative secret-path reference; mailbox/credential kind; acquisition steps and bounded failure classes without access URLs; tenant/membership; claimed role and observed capabilities; owned object ids; authentication realm/channel; lifecycle events; valid assets; expiry; disposition; blocker; and cleanup owner in `engagements/<name>/knowledge-base/identities.md`. This is the explanatory human record; never copy secret values into it.

Retire disposable accounts, sessions and objects where the product permits it, verify cleanup and remove their secret directory after no recovery or audit need remains. When deletion is unavailable, log out/revoke what the product supports and retain the minimum recovery material for the inert fixture with cleanup owner/reopen trigger; do not make closure impossible by claiming deletion occurred. `satisfied` never closes the FIXTURE item: set its queue state to `terminal` only after every requester and audit need is finished and cleanup is either verified or recorded as an exact inert-retained disposition.

Return the requesting queue and canonical id, satisfied requirement, opaque fixture labels, observed capabilities, owned objects, remaining prerequisite, expiry/reopen condition, cleanup state, and exactly one `acquisition_status`: `satisfied`, `continue`, or `operator-blocked`. Use `satisfied` only when the requesting action can now run; it releases that action but does not terminally close the FIXTURE item while cleanup is pending. Use `continue` while another normal acquisition action remains; use `operator-blocked` only for the exact exhausted operator-only gate. Never return raw credentials or mailbox contents.

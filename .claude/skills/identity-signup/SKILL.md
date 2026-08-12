---
name: identity-signup
description: Resolve an exact fixture prerequisite by preparing the minimum owned identities, roles, tenants, sessions, lifecycle states, and objects needed by authorized extraction, hunting, or validation while keeping secrets outside model-visible artifacts. Use only when a named queue action is blocked by missing fixtures or an expired baseline.
---

# Identity fixtures

## Owner and handoff

The orchestrator runs this skill inline at the private-state boundary; do not delegate credentials, mailbox access or secret-bearing browser state to a general agent. The skill consumes one exact fixture requirement and returns opaque labels, observed capabilities, owned controls, expiry and cleanup state to the blocked queue action. It does not invent a fixed account matrix, test a vulnerability or change queue priority.

## Derive the fixture need

Start from the canonical operation/flow or hypothesis. Name the exact missing subject, tenant, role, lifecycle state, credential type, owned object, and positive/negative control it enables. Do not build a fixed account matrix or create speculative tenants/accounts.

Prefer existing operator-provided test identities and privately controlled email addresses. Use consumer self-signup only when program rules permit it; use the normal browser flow and a private disposable inbox/domain, never a public temporary mailbox. Use SSO, payment, or transit systems normally without probing them.

For financial, KYC, enterprise, paid, production-sensitive, or staff-only states, request documented operator fixtures rather than imitating eligibility.

## Provision and baseline

1. Inventory existing owned identities and record only observed capabilities; distinguish intended role labels from permissions actually exercised.
2. Obtain the minimum missing identity through the product's normal signup, invite, membership, role-change, or tenant-creation flow.
3. Stop for the operator at CAPTCHA, OTP, bot protection, KYC, PII, payment, domain approval, or any human-verification gate. Never rotate domains or flows to evade a control.
4. Create unique controlled markers and only the disposable objects required for positive, negative, same-tenant, or cross-tenant fixtures.
5. Capture a baseline happy path and denial relevant to the active question. After role, tenant, plan, or credential changes, re-baseline rather than assuming the label changed enforcement.

## Tool routing

Use headless `playwright` for normal signup, login, invite, role and tenant flows because it preserves browser state and exposes the authentication realm, redirects, baseline requests and human gates. Use `playwright-headed` only when operator interaction is unavoidable or a recorded headless limitation blocks the exact step; complete that step, then return to headless. Stop for the operator when credentials, mailbox access, CAPTCHA, OTP, payment or approval cannot remain private and tool-managed.

Name browser contexts with opaque fixture labels. Never place passwords, cookies, tokens or mailbox links in CLI arguments, prompt text, screenshots or exported captures. Record only redacted request identifiers and observed capabilities.

The project Playwright MCP uses isolated in-memory state. Treat MCP/browser restart as credential expiry: re-establish the normal login and baseline or mark the fixture blocked. Never export storage state into the project or knowledge base.

## Secret boundary

Prefer tool-managed authenticated browser contexts or credential injection in which the model receives only a stable label. A private reference must be usable by the execution tool without revealing its value; if no such resolver exists, mark direct API replay blocked instead of placing the secret in prompts or shell text.

Keep passwords, cookies, JWTs, API keys, mailbox tokens, private keys, and plaintext browser storage outside the knowledge base, transcript, evidence, reports, and agent messages. Store only the private reference label, credential kind, valid asset/realm, expiry, and rotation/revocation state.

Never copy a secret-bearing legacy artifact into a new prompt. If one is encountered, stop reading it, record its path as a secret-handling issue without its value, and request operator cleanup/rotation.

## Capability and lifecycle record

For each identity label, record tenant/membership, claimed role, observed capabilities, owned fixture IDs, authentication realm/channel, credential lifecycle events, valid assets, expiry, blockers, and cleanup owner in `engagements/<name>/knowledge-base/identities.md`. Retire or revoke disposable identities/credentials and verify cleanup where the product permits it.

Return fixture requirements satisfied, observed capability deltas, private labels usable by tools, owned objects, missing fixtures, blockers, expiry/reopen conditions, and verified or operator-owned cleanup. Never return raw credentials.

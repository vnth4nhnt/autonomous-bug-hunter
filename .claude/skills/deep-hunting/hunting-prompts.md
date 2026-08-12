# Coverage model and mechanism prompts

## Versioned coverage sources

Use [OWASP WSTG v4.2](https://owasp.org/www-project-web-security-testing-guide/v42/) as the reproducible test-case base. At engagement start, inspect the [official WSTG project index](https://owasp.org/www-project-web-security-testing-guide/) for material release/development deltas and record the exact version, page and access date used; never present a development id as a stable id. Use the current official [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) stable release (5.0.0 at this method revision) and current mechanism standards as control-objective sources, not as claims that a black-box test can verify every requirement. For OAuth/OIDC decisions include [RFC 9700](https://www.rfc-editor.org/rfc/rfc9700.html) and the applicable OpenID Connect specification; use the actual protocol/profile implemented. Do not invent ids or trust model memory when the versioned source is available.

Review every WSTG v4.2 category for relevance to each canonical decision: Information Gathering (`INFO`), Configuration and Deployment (`CONF`), Identity Management (`IDNT`), Authentication (`ATHN`), Authorization (`ATHZ`), Session Management (`SESS`), Input Validation (`INPV`), Error Handling (`ERRH`), Weak Cryptography (`CRYP`), Business Logic (`BUSL`), and Client-side (`CLNT`). WSTG is the structured floor, not a site-wide payload list or the limit of coverage.

Treat every standard as an objective source, never as a required tool, order, request count or payload ritual. A source-assisted proof, runtime differential, state transition, protocol trace or hybrid may satisfy an objective when it covers the same decision and axes with the required controls. Prefer the evidence path that can most efficiently falsify or confirm the highest-severity credible premise; never skip deployment binding for a live-impact claim.

## Applicability state machine

- `applicable`: the primitive, decision or trust boundary is observed, declared with credible runtime reachability, or required by the normal flow.
- `unresolved`: visibility is insufficient; return the exact graph/code/runtime question to extraction. Absence of UI, JavaScript, local content, a fixture, or a successful request is not evidence of absence.
- `blocked`: the test is known and applicable but its minimum safe execution needs an unavailable operator-only prerequisite. Block only dependent axes and continue independent work.
- `not-applicable`: positive evidence excludes the primitive or security decision from the audited boundary. Record that evidence and a reopen trigger.
- `tested-bounded`, `candidate`, or `dedup`: terminal only for the named objective, role/state/channel and coverage axes.

One experiment may satisfy several objectives only when its controls and evidence prove each one. Existing evidence is a terminal substitute only for the same decision, implementation, material axes and proof floor; otherwise it is a seed.

## Coverage axes

For every surface vary or positively dispose of all severity-changing axes:

- subject and credential: anonymous, user/role, machine, token/cookie/key, identity realm and credential lifecycle;
- object and action: ownership, parent-child binding, field/function and read/create/update/delete/approve/share/export transitions;
- role and tenant: horizontal, vertical, cross-tenant, delegated and support/admin boundaries;
- lifecycle: precondition, pending, accepted, expired, revoked, deleted, retried, migrated and stale state;
- channel and protocol: UI/API, REST/GraphQL, WebSocket/SSE/gRPC, version, method, content type and identifier transport;
- parser and consumer: normalization, serialization, template/query/command, file/archive/document/media, URL fetch, browser/DOM and downstream worker;
- service and trust edge: gateway, API, worker/queue, webhook, email, storage/CDN, signed capability and third-party callback;
- timing and shared state: concurrency, idempotency, retries, cache key, replication, quotas and ordering.

## Mechanism prompts

Apply only when supported by the graph, but do not require the upstream stage to have named the vulnerability class.

### Identity, authentication and federation

For any login, external redirect, callback, trusted identity header or session-establishment edge, model the in-scope relying party independently of the IdP. Test the local initiation, callback, binding and session decisions while using an out-of-scope IdP normally. Examine exact redirect-URI binding; state, nonce and PKCE where applicable; issuer, client, tenant and audience binding; authorization-response mix-up; code/token injection, substitution and replay; login CSRF/session fixation; account linking and subject/email ambiguity; invite/domain trust; step-up and recovery; logout/revocation; error leakage; and redirect/token leakage. Prove a realistic unauthorized session or retained capability; a parameter anomaly or forged-header acceptance alone is a signal.

### Authorization, tenancy and capability

Test object, parent, action, function and field authorization independently across owned same-tenant, cross-role and cross-tenant controls. Include indirect identifiers, search/batch endpoints, alternate versions/channels, async job/status/artifact access, invite/approval/transfer, share/export and signed-capability issuance, scope, audience, expiry and revocation. Distinguish authentication, existence, intended sharing and bearer behavior from unauthorized acquisition or action.

### Gateway, protocol, cache and parser differentials

Examine only grounded alternate methods, versions, content types, path/header/body transports, duplicate keys, normalization boundaries, proxy/application disagreement, CORS/origin enforcement, cache keys and error paths. A 401/403, redirect, status change or parser error is a differential signal, not proof. Use valid/impossible siblings and preserve all coupled request semantics except the tested axis.

### Async, webhook and service-edge behavior

Trace producer, queue/job, worker, callback, retry/cancel, artifact and final consumer. Attribute OAST callbacks to the requester and bind jobs/events/configuration to tenant, subject and destination. Examine redirect/DNS/URL validation consistency, TOCTOU, replay/idempotency, signed delivery, stale configuration, confused-deputy behavior and cross-service authorization. A callback proves reachability only.

### File, data and execution pipelines

Trace name, metadata, content, archive paths, parser selection, conversion, preview, storage and final renderer. Test only formats and transforms evidenced by the product. Distinguish upload/storage from server-side parsing, browser execution and command execution. For a credible execution path, prove context with a non-persistent canary and only the bounded impact rung allowed by `CLAUDE.md`.

### Client and browser trust

Trace controllable source through every transform to the executed sink and affected origin/context. Cover DOM/HTML/script/style/URL injection, navigation, resource loading, `postMessage`, storage, service workers, WebSockets, cross-origin reads/actions, clickjacking and client-enforced trust. Demonstrate the actual victim-context consequence; reflection or a dangerous API name is only a lead.

### Business logic and composition

Model valid state transitions, entitlement/quota, pricing, approval, retry/cancel, idempotency, ordering, races, stale replicas and cross-feature assumptions. Preserve narrow demonstrated primitives as possible chain edges. Attempt a compound path only when every prerequisite and transition is evidence-backed, and report the highest executed consequence rather than an imagined chain.

## Proof floors

- Authorization: owned same-boundary positive, valid cross-boundary subject/object control, nonexistent or invalid negative, and proof of the unauthorized consequence.
- Authentication/session: realistic acquisition, substitution or retention of credential/session state and the resulting unauthorized capability.
- Injection/parser: controlled input reaches and changes the claimed parser or sink; reflection, generic error and payload-shaped output are signals only.
- Browser/client: source-transform-sink reachability in the affected origin and victim context plus concrete security consequence.
- SSRF/OAST: fresh correlation and requester attribution; claim only observed reachability, data, action, credential or boundary impact.
- Timing/race/cache: fresh markers, interleaved controls, before/after state and enough samples to separate jitter, rate limits, WAF, replication and caching.
- Code execution: distinguish server execution from template arithmetic, deserialization errors, SSRF, client execution and timing noise; no shell, secrets, persistence, pivot or service modification.
- Components/secrets/chains: a version, key, map, callback or CVE match is a lead. Prove reachability and every dependency; never inherit severity from an unexecuted link.

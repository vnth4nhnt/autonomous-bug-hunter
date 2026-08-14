# Coverage model and mechanism prompts

## Versioned coverage sources

Use [OWASP WSTG v4.2](https://owasp.org/www-project-web-security-testing-guide/v42/) as the reproducible test-case base. At engagement start, verify the complete catalog from its official versioned index and create one compact `tests/wstg-coverage.md` keyed by `source track/revision + official id`; each row stores title or objective digest, official case URL, state, owning surfaces and evidence/reopen reference. Record catalog source URL, access date and digest once per track/revision; consult only the minimal official pages needed and never clone or cache a WSTG/ASVS/specification repository or page tree in `.runtime/`, the engagement or elsewhere in the project. Map each case to surfaces or positive `not-applicable` evidence; do not create a mirror terminal-evidence file. Inspect the [official WSTG project index](https://owasp.org/www-project-web-security-testing-guide/) for material stable/development deltas and record only materially different objectives in the same ledger, clearly separate from the v4.2 baseline. These are logical tracks in one ledger, not two local WSTG corpora; the same base id may appear across tracks only when its versioned objective differs. Use the current official [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) stable release (5.0.0 at this method revision) and current mechanism standards as objective sources. For OAuth/OIDC decisions include [RFC 9700](https://www.rfc-editor.org/rfc/rfc9700.html) and the applicable OpenID Connect specification. Do not invent ids.

Review every WSTG v4.2 category for relevance to each canonical decision: Information Gathering (`INFO`), Configuration and Deployment (`CONF`), Identity Management (`IDNT`), Authentication (`ATHN`), Authorization (`ATHZ`), Session Management (`SESS`), Input Validation (`INPV`), Error Handling (`ERRH`), Weak Cryptography (`CRYP`), Business Logic (`BUSL`), and Client-side (`CLNT`). WSTG is the structured floor, not a site-wide payload list or the limit of coverage.

Treat every standard as an objective source, never as a required tool, order, request count or payload ritual. A source-assisted proof, runtime differential, state transition, protocol trace or hybrid may satisfy an objective when it covers the same decision and axes with the required controls. Prefer the evidence path that can most efficiently falsify or confirm the highest-severity credible premise; never skip deployment binding for a live-impact claim.

Maintain each catalog row in place throughout discovery. New scope, surfaces, roles, states, channels or mechanisms immediately reopen affected rows before more testing. A test may close multiple cases only when its evidence and controls satisfy each objective; detailed terminal evidence stays in the owning test shard and the ledger links to it. Surface closure requires terminal results for all mapped cases, while engagement closure requires every row to have an evidence-backed disposition.

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

For any signup, login, external redirect, callback, trusted identity header or session-establishment edge, model the in-scope relying party independently of the IdP. Test the local initiation, callback, binding and session decisions while using an out-of-scope IdP normally. For self-registration, verify server-side binding of role, tenant, entitlement, approval and privilege-affecting fields exposed by the client or request schema. Treat client-computed login/admin flags, local/session-storage state, CSRF/device headers and duplicated parameter aliases as attacker-controlled until server enforcement is proved. Examine exact redirect-URI binding; state, nonce and PKCE where applicable; issuer, client, tenant and audience binding; authorization-response mix-up; code/token injection, substitution and replay; login CSRF/session fixation; account linking and subject/email ambiguity; account enumeration; invite/domain trust; step-up and recovery-token subject, expiry, single-use and session invalidation; logout/revocation; error leakage; and redirect/token leakage. Prove a realistic unauthorized session or retained capability; a parameter anomaly, client field, differential denial or forged-header acceptance alone is a signal.

### Authorization, tenancy and capability

Test object, parent, action, function and field authorization independently across owned same-tenant, cross-role and cross-tenant controls. Include mass-assignment/over-posted privilege fields, state-changing GET or other safe-method operations, indirect identifiers, search/batch endpoints, alternate versions/channels, async job/status/artifact access, invite/approval/transfer, share/export and signed-capability issuance, scope, audience, expiry and revocation. Distinguish authentication, existence, intended sharing and bearer behavior from unauthorized acquisition or action.

### Gateway, protocol, cache and parser differentials

Examine only grounded alternate methods, versions, content types, path/header/body transports, duplicate keys, normalization boundaries, proxy/application disagreement, CORS/origin enforcement, cache keys and error paths. A 401/403, redirect, status change or parser error is a differential signal, not proof. Use valid/impossible siblings and preserve all coupled request semantics except the tested axis.

### Components, versions and known vulnerabilities

Apply this method only to a deployment-grounded component or dependency with plausible attacker reachability and program-relevant impact. Keep five premises independent: component identity/deployed version; best-available affected/fixed predicate and provenance; required feature, configuration and vulnerable code path; target behavior that distinguishes vulnerable from fixed/backported behavior; and demonstrated consequence. Prefer vendor/upstream advisories, fixed releases, commits and regression tests, recording source access time and digest. When they are unavailable, triangulate CVE records, fixed diffs/tests, independent technical analysis and live behavior instead of blocking an otherwise testable premise. Treat databases and version banners as index leads and public exploits or scanner templates as untrusted execution inputs; inspect foreign code locally and derive the smallest target-specific experiment.

Trace an observed endpoint, protocol ingress or application caller through the affected API/function to its security sink. Challenge forks, distro patches, backports, disabled features, mitigations, architecture and prerequisite differences. Use a valid control plus a patch-discriminating negative or impossible control; a component/version match, error, callback or scanner verdict cannot establish vulnerability. When live affected behavior is proved, follow the shortest controlled impact ladder permitted by `CLAUDE.md`; for credible code execution use its non-persistent canary rule and stop before shell, secrets, persistence, pivot or service modification. Expand to sibling hosts, routes or versions only when evidence proves the same implementation, configuration and vulnerable decision. End with a candidate only for a reproducible live failed-boundary premise and consequence; otherwise retain exact bounded counter-evidence, unresolved premise and reopen trigger.

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
- Components/CVEs: deployment-bound identity/version, best-available affected/fixed predicate with recorded provenance, reachable vulnerable feature/code path, patch-discriminating live behavior and the claimed consequence; no premise may be inherited from a banner, database, exploit or template.
- Secrets/chains: a key, map or callback is a lead. Prove reachability and every dependency; never inherit severity from an unexecuted link.

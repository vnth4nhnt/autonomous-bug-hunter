# WSTG application and target-specific extensions

Use the [OWASP Web Security Testing Guide v4.2](https://owasp.org/www-project-web-security-testing-guide/v42/) as the versioned coverage spine. Consult its versioned index and relevant test page when building a plan; never invent an id from memory. Apply it to the observed surface, not as a blind site-wide payload list. Record references as `WSTG-v42-<CATEGORY>-<NUMBER>` when an exact case exists.

## Applicability floor

Consider every v4.2 category for each canonical surface: Information Gathering (`INFO`), Configuration and Deployment (`CONF`), Identity Management (`IDNT`), Authentication (`ATHN`), Authorization (`ATHZ`), Session Management (`SESS`), Input Validation (`INPV`), Error Handling (`ERRH`), Weak Cryptography (`CRYP`), Business Logic (`BUSL`), and Client-side (`CLNT`).

- Map tests to the operation, role, tenant, state, protocol, parser, and consumer actually observed. A REST, GraphQL, WebSocket, worker, upload, export, or browser surface may require controls from several categories.
- For each applicable case record exact versioned id, objective, fixtures, controls, oracle, result, and reopen condition. One experiment may close several ids only when its evidence explicitly satisfies every objective. For `not-applicable`, record the missing feature or boundary evidence; do not infer it from an unvisited UI or one denial.
- WSTG is the minimum structured coverage, not the limit. After it, test credible target-specific mechanisms derived from the security graph.

## Target-specific extensions

Use only extensions supported by observed architecture:

- alternate API versions, GraphQL operations, WebSocket/SSE messages, mobile/SDK siblings, batch and indirect identifiers;
- tenant/role/ownership binding across parent-child objects, async jobs, search, share, export, approval, invite, transfer, and revocation;
- workflow ordering, replay, idempotency, retry/cancel, entitlement/quota, races, stale replicas, cache keys, and lifecycle transitions;
- parsers and consumers for templates, commands, queries, XML, serialization, archives/filesystems, URL fetching, documents/media, spreadsheets, DOM, `postMessage`, and structured AI/tool input;
- workers, webhooks, signed capabilities, CDN/storage, service boundaries, producer-consumer transformations, and third-party callbacks.

Prefer a new security decision or failure mechanism over payload variants. Name the current primitive, highest credible scoped consequence, and shortest controlled evidence ladder between them.

## Proof floors

- Authorization: use owned same-boundary positives and cross-boundary controls; distinguish authentication, existence, tenancy, role, field, and function enforcement; prove the unauthorized consequence.
- Authentication/session: prove realistic acquisition or retention of the credential/state and the resulting capability; weak settings or forged-header acceptance alone are insufficient.
- Injection/parser: prove that controlled input reaches and changes the claimed parser or sink. Reflection, generic errors, and payload-shaped output are signals only.
- Browser/client: demonstrate the claimed behavior in the affected origin and victim context; trace source, transforms, sink, and security consequence.
- SSRF/OAST: attribute the requester. A correlated callback proves outbound reachability only; claim only observed internal data, action, credential, or boundary impact.
- Timing/race/cache: use fresh markers, interleaved controls, before/after state, and enough samples to separate jitter, rate limits, WAF, replication, and cache behavior.
- Code execution: distinguish server command execution from template arithmetic, deserialization errors, SSRF, client execution, and timing noise. Prove context with a non-persistent canary and at most one bounded capability allowed by `CLAUDE.md`; no shell, secrets, persistence, pivot, or service modification.
- Components/secrets/chains: versions, keys, source maps, callbacks, or CVE matches are leads. Prove reachability and concrete impact; reproduce every dependency and never inherit severity from an unexecuted link.

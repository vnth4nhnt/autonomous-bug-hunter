---
name: attack-surface-extraction
description: Adaptively build and close the security graph for one authorized application or value edge from runtime, source, schemas, recovered code, documentation, SDK/mobile artifacts or hybrid evidence, then emit canonical decisions and executable hunt seeds. Use after recon and whenever new code, identity, operation, state, protocol, parser, consumer, service, trust edge or deployment evidence appears.
---

# Attack-surface extraction

## Owner and objective

Run this skill inline because the orchestrator alone owns the shared security graph, `surface-inventory.md`, `surfaces.md`, and extraction/hunt queues. Consume one `extract` host or relationship item and turn the strongest available evidence into canonical security decisions without judging vulnerability. Track one `extraction_status`: `continue`, `graph-bounded`, or `operator-blocked`; discoveries and fixture/hunt/recon work are separate handoffs and never close the originating graph item.

A redirect-only host, external consumer, absent document, missing fixture or no JavaScript remains extractable: preserve the in-scope relying party, producer, callback, session and trust decision. Extraction is complete by explained decisions and frontiers, not by executing a fixed technique.

## Adaptive evidence strategy

Before collection, name the uncertainty and inventory available evidence: observed runtime and protocol traffic; authoritative or public source; build/version/package metadata; OpenAPI, GraphQL, WSDL or other schemas; recovered assets/source maps; forms, headers and manifests; SDK/mobile artifacts; documentation, tests and migrations; prior captures and normal external dependency flows.

Assign source-to-deployment confidence:

- `exact`: a commit, build, artifact or digest is bound to the deployment;
- `corroborated`: multiple deployment-specific signatures support the same version or implementation;
- `family-only`: upstream product/framework relevance is known but version, fork or configuration is not;
- `unknown`: no reliable implementation binding exists.

Choose runtime-, source-, schema-, recovered-code-, artifact- or hybrid-assisted extraction by expected security-coverage gain, confidence, cost and risk. Reuse evidence that is equivalent for the decision being mapped; never repeat discovery solely to satisfy a default path.

When source or a schema maps strongly to deployment, compile routes, policies, state machines, parsers, workers, integrations and client sinks from it, then spend runtime work on deployment deltas: enabled features, configuration, patches/forks, plugins, gateway behavior, identity/storage integrations and actual reachability. Upstream source, documentation, a version banner or a CVE match alone never proves deployed behavior.

## Frontier loop

1. Establish separate open frontiers for relationships/value flows, runtime identities/roles/states/channels, route/manifest/import discovery, API/message call sites, source/schema/code, and source-to-deployment deltas. For every discovered reference record its parent, kind, provenance/digest, status `queued|resolved|equivalent|gated|blocked`, discoveries and exact rationale. Pick the highest-value uncertainty, state the chosen evidence strategy and pivot condition, and revise it when its expected gain falls.
2. Execute normal public or available owned flows with the client that preserves their semantics: headless browser for browser context, protocol client for API/message systems, or local inspection for source/schema artifacts. Capture subjects, credentials, producers, consumers, enforcement points, redirects/callbacks, messages, jobs, downloads, storage changes and downstream output. Use out-of-scope dependencies only normally; never probe them.
3. For a client application, enumerate routes and entry artifacts from observed navigation, links/forms, recon-discovered `robots.txt`/sitemaps/public route indexes, inline/bootstrap/runtime configuration, scripts, import maps, preload/modulepreload references, router/build/asset/service-worker manifests and framework route metadata. Inventory public endpoint/config leaves, internal service names and external consumers without promoting disclosure to impact. Cluster content-only routes only when they have the same entry/import set and security decision; resolve every distinct public or available security-bearing route and every unique entry/import set that can expose identity, account, recovery, role, tenant, cart/checkout, upload, search, admin, messaging or state mutation. A page sample, landing-page network capture or already-downloaded common bundle never closes an unfetched route-specific chunk.
4. Build a fixed-point client asset graph. Canonicalize without discarding query/version semantics and queue every public or owned-fixture-reachable executable asset from the route roots, including inline executable blocks as parent-bound digest-addressed assets, then fetch each remote asset once and recursively resolve static/dynamic imports, bundler chunk maps/loaders, workers/service workers, WASM and referenced public source maps. Hash identical bytes for evidence-backed deduplication, but keep different route, loader and execution contexts. Use parsing/AST or recovered source when minification or bundling obscures structure; regex, string extraction and already-downloaded common bundles are preliminary only. Record every asset/reference parent, digest and `queued|analyzed|equivalent|gated|blocked` disposition. Locally classify third-party code already delivered by a normal flow, but do not crawl its host.
5. For each API/message call site resolve module/config aliases and record URL/template, REST/RPC method or GraphQL operation/persisted id or message/event name, content type, parameter/body field names, credential/header construction, caller route/state, response consumer and client guard. Add or refine its exact operation row in `surface-inventory.md`; never collapse different methods, operations, material schemas or access contexts behind one path. Trace local/session storage, cookies, CSRF/device tokens, client-computed login/admin/role headers, recovery values, duplicated aliases and state-changing safe-method calls. Classify observed credentials and capabilities by their evidenced structure, protection, binding, lifecycle, transport, storage and consumers without retaining secrets; map the resulting mechanisms to exact WSTG cases rather than hardcoding token families. Privilege fields or client-only decisions become hunt seeds. A string match or GET sweep does not establish request semantics, authorization or reachability.
6. Reconcile the static graph with headless runtime for every public or owned-fixture-reachable security-bearing route/flow and every materially different available role, tenant and lifecycle state. Record the actual route state, loaded asset set, requests/messages, storage/credential changes, guards and downstream consumers; diff the sets across contexts instead of assuming one session represents all. A statically declared route or operation remains `declared`, not `observed`, until deployment binding and runtime reachability are evidenced; a runtime-only asset or operation reopens the asset graph.
7. Inspect source/schema evidence for routes, controllers/resolvers, middleware/policies, models, configuration/feature gates, jobs, parsers, integrations, protocol messages and tests that expose intended invariants. Continue any evidence frontier while resolving it yields a new route, operation, subject, state, consumer, trust edge or security decision.
8. Scope-check each remote host before fetching. An exact asset URL referenced or loaded by the in-scope application may be consumed normally from its CDN/provider and analyzed locally; do not enumerate or test that external host. Preserve provenance and digest for each artifact or source snapshot. Local formatting, decoding, AST analysis and search may aid inspection, but absence of a literal is never evidence of absence.
9. Build the graph from every value-bearing edge: source, destination, value/capability, subject, credential, object/action/state, protocol, enforcement point, trust assumption and evidence. Trace controllable values through normalization, request construction, authorization/validation, gateway/service, queue/worker/parser/storage/cache and final consumer.
10. Reconcile declarations with deployment evidence. A route, policy, schema, source path or client guard is `declared`/`inferred` until runtime or an exact deployment binding grounds it. `gated` requires evidence of the exact prerequisite; lack of visibility is `unresolved`; the knowledge state `blocked` requires an operator-only prerequisite after autonomous fixture resolution. Split decisions when enforcement, parser, credential, version, channel or trust boundary differs. Repeat from the highest-value frontier and, before closure, re-enumerate each root until the asset/reference/operation ledger reaches a no-delta fixed point; any new item or unexplained count/digest delta reopens the loop, invalidates affected downstream vector/hypothesis closure and emits exact hunt remapping. Use `extraction_status: continue` while any frontier, autonomous fixture path or exact handoff remains open; use `graph-bounded` only when the closure contract holds; use `operator-blocked` only when every remaining extraction action depends on an exact operator-only gate.

## Security-relevant analysis

Across the selected evidence, look for:

- identities, sessions, tenants, roles, privileges, feature gates, signed capabilities and credential lifecycle;
- REST/GraphQL, WebSocket/SSE/gRPC, SDK/mobile, batch/async, webhook, email, storage/CDN and producer-consumer operations;
- object/action binding, state transitions, retry/replay/cancel, alternate versions/channels, client-only enforcement and downstream trust;
- OAuth/OIDC/SAML initiation, issuer/client/tenant choice, callback, state/nonce/PKCE, token/session consumption, account linking and logout;
- controllable browser sources and HTML/URL/script/style/navigation, dynamic loading, `postMessage`, storage, service-worker, fetch, download and file/URI sinks;
- parser/consumer paths for queries, templates, commands, serialization, URLs, archives, documents/media and other evidenced transformations.

Trace source-to-transform-to-sink or subject-to-decision-to-consequence paths rather than matching dangerous words. Establish reachability and controlling context only as far as needed to define the surface; exploitability belongs to `deep-hunting`.

## Interaction inventory contract

Maintain one normalized Markdown table in `engagements/<name>/knowledge-base/surface-inventory.md`:

| Domain | Endpoint / interaction | Method / action | Params | Body / message | Authentication | Authorization |
| --- | --- | --- | --- | --- | --- | --- |
| api.example.com | /api/user | GET | query:user_id={user_id} | [-] | [+] session cookie | SELF |
| api.example.com | /api/user | POST | query:user_id={user_id} | form:{username,...} | [+] session cookie | SELF |

Include every reachable or credibly deployment-bound user-controllable interaction: security-bearing pages/forms/actions, REST/RPC/GraphQL operations, WebSocket/SSE/gRPC messages, callbacks, uploads/downloads, signed-capability flows, webhook/job actions and other producer/consumer entry points. Use the host authority in `Domain`; a normalized path or named interaction in `Endpoint / interaction`; the exact HTTP method, operation or event action in `Method / action`; and location-qualified structural placeholders in `Params`. Record content type plus field shape in `Body / message`, never live values or secrets. Use `[-] anonymous`, `[+] session cookie`, `[+] bearer`, another evidenced mechanism, or `[?] unresolved` for authentication.

Authorization is one of `PUBLIC`, `AUTHENTICATED`, `SELF`, `OWNER`, `MEMBER`, `ROLE:<role>`, `CAPABILITY`, `SERVICE` or `UNKNOWN`. `MEMBER` covers tenant, workspace or organization membership; use the exact target role after `ROLE:`. Join simultaneous requirements with `+`, for example `MEMBER+OWNER`; represent alternative access contexts as separate rows. Keep entitlement, lifecycle and other detailed predicates in `surfaces.md`. Never use subjective labels such as `normal user`, `authorized user`, `privileged user` or an invented role. A UI guard alone does not establish server authorization. Record the normal/intended policy supported by evidence; a suspected or demonstrated bypass belongs in the test/candidate record and does not silently rewrite the policy cell.

Keep one row per distinct method/action and per materially different operation, content type, request shape or access context. Update a row when stronger evidence resolves a field; do not append stale duplicates. The table is an inventory projection, not proof of reachability or enforcement: preserve provenance, `observed|declared|inferred|gated|unresolved|blocked` state, caller/consumer and canonical-surface mapping in `surfaces.md` and artifacts. Every row maps to a canonical surface or an evidence-backed non-security rationale, and every canonical user-controllable operation maps back to at least one row.

## Canonical surface and hunt-seed contract

For each surface record:

- stable id and fingerprint from value, decision, enforcement point, object/action, protocol and trust boundary;
- producers/consumers, components, subjects/credentials, object/action/state, channel/version, boundary and intended invariant;
- controlled inputs/identifiers, downstream sinks/consumers and a normal runtime seed or grounded dependency edge;
- evidence strategy, provenance/digests, source-to-deployment confidence, known deployment deltas and contradictions;
- route/manifest/import and API/message frontier evidence, including method/request-shape provenance and unresolved references;
- knowledge state and coverage matrix across subject/credential, object/action, role/tenant, lifecycle, channel/version, parser/consumer, service/trust and timing/cache axes;
- applicable versioned objectives and one or more executable hypothesis seeds: attacker/preconditions, failed invariant, oracle, positive/negative controls, highest credible consequence, first bounded experiment and pivot condition;
- unknowns, blockers and exact reopen conditions.

Keep variants together only when evidence proves the same implementation and security decision. Similar names, upstream ancestry or shared UI are insufficient for deduplication.

## Tool selection

Choose tools by semantics rather than ritual. Use headless `playwright` for browser-origin and client-state behavior; a protocol client for API/message systems; `rg` plus local formatting/AST inspection for collected source; and `sourcemapper` for a public map referenced by the scoped deployment. Use headed mode only for unavoidable operator interaction or a recorded headless limitation. Do not run generic payload hunting during extraction. Use OAST only when a normal owned feature must establish a producer/consumer edge; a callback proves reachability only.

Keep secrets tool-managed. Record the strategy, tool/version, artifact or source identity, fixture label, exact action and uncertainty resolved.

## Closure and output

Close extraction only when:

- every observed value edge maps to a surface or evidence-backed non-security rationale;
- relationship, runtime/state/channel, route/manifest/import, API/message call-site, source/schema/code and deployment-delta frontiers are empty or covered by an evidenced equivalent; any blocked frontier returns `operator-blocked` and does not satisfy graph closure;
- every distinct security-bearing route and unique entry/import set is resolved, while every omitted content-only cluster has evidence of the same artifact set and security decision;
- every public or owned-fixture-reachable client asset has an analysis disposition, every discovered import/loader edge is resolved, and static and runtime asset/operation sets reconcile at a no-delta fixed point;
- every discovered operation has a canonical disposition and grounded normal method/request shape or an exact unresolved prerequisite; bulk GET status probing cannot satisfy this condition;
- the interaction table has no missing, stale-collapsed or duplicate operation variant and reconciles exactly with the final runtime, source/schema, client-asset and canonical-surface operation sets;
- every security-relevant reference is resolved without requiring redundant recovery of equivalent minified/generated artifacts;
- a final root re-enumeration produces no new reference, operation, unexplained count/digest delta, decision, code path or deployment delta;
- artifact/import closure and runtime/enforcement closure are recorded separately; a complete static corpus cannot prove route reachability, server authorization or consequence;
- every testable surface has a complete fingerprint, coverage matrix and executable hunt seed.

Update the active engagement's `target-profile.md`, `surface-inventory.md`, `surfaces.md`, `working-state.md` and redacted artifacts. Write every target-derived capture, download, source snapshot and retained scratch beneath its knowledge base; ingest and clear any unavoidable tool spill before returning. Return the graph item id; chosen strategies and pivots; evidence and deployment confidence; frontier ledger and final no-delta reconciliation; graph/surface deltas; operation inventory; contradictions/blockers; exact fixture/hunt/recon handoffs; remaining actions; and exactly one `extraction_status` with rationale.

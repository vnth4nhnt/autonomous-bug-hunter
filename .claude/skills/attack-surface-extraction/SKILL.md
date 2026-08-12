---
name: attack-surface-extraction
description: Adaptively build and close the security graph for one authorized application or value edge from runtime, source, schemas, recovered code, documentation, SDK/mobile artifacts or hybrid evidence, then emit canonical decisions and executable hunt seeds. Use after recon and whenever new code, identity, operation, state, protocol, parser, consumer, service, trust edge or deployment evidence appears.
---

# Attack-surface extraction

## Owner and objective

Run this skill inline because the orchestrator alone owns the shared security graph, `surfaces.md`, and extraction/hunt queues. Consume one `extract` host or relationship item and turn the strongest available evidence into canonical security decisions without judging vulnerability.

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

1. Establish separate open frontiers for relationships/value flows, runtime identities/roles/states/channels, source/schema/code, and source-to-deployment deltas. Pick the highest-value uncertainty, state the chosen evidence strategy and pivot condition, and revise it when its expected gain falls.
2. Execute normal public or available owned flows with the client that preserves their semantics: headless browser for browser context, protocol client for API/message systems, or local inspection for source/schema artifacts. Capture subjects, credentials, producers, consumers, enforcement points, redirects/callbacks, messages, jobs, downloads, storage changes and downstream output. Use out-of-scope dependencies only normally; never probe them.
3. Inspect the selected evidence recursively only while it can reveal new security decisions or unresolved references. For client code include HTML/bootstrap data, imports, chunks, manifests, workers/service workers, WASM and referenced maps. For source/schema include routes, controllers/resolvers, middleware/policies, models, configuration/feature gates, jobs, parsers, integrations, protocol messages and tests that expose intended invariants.
4. Scope-check each remote host before fetching. Preserve provenance and digest for each artifact or source snapshot. Local formatting, decoding, AST analysis and search may aid inspection, but absence of a literal is never evidence of absence.
5. Build the graph from every value-bearing edge: source, destination, value/capability, subject, credential, object/action/state, protocol, enforcement point, trust assumption and evidence. Trace controllable values through normalization, request construction, authorization/validation, gateway/service, queue/worker/parser/storage/cache and final consumer.
6. Reconcile declarations with deployment evidence. A route, policy, schema, source path or client guard is `declared`/`inferred` until runtime or an exact deployment binding grounds it. `gated` requires evidence of the exact prerequisite; lack of visibility is `unresolved`; a known operator-only prerequisite is `blocked`. Split decisions when enforcement, parser, credential, version, channel or trust boundary differs.
7. Repeat from the highest-value open frontier until new evidence yields no unexplained security decision, reference or deployment delta. Do not close one frontier merely because another is exhaustive.

## Security-relevant analysis

Across the selected evidence, look for:

- identities, sessions, tenants, roles, privileges, feature gates, signed capabilities and credential lifecycle;
- REST/GraphQL, WebSocket/SSE/gRPC, SDK/mobile, batch/async, webhook, email, storage/CDN and producer-consumer operations;
- object/action binding, state transitions, retry/replay/cancel, alternate versions/channels, client-only enforcement and downstream trust;
- OAuth/OIDC/SAML initiation, issuer/client/tenant choice, callback, state/nonce/PKCE, token/session consumption, account linking and logout;
- controllable browser sources and HTML/URL/script/style/navigation, dynamic loading, `postMessage`, storage, service-worker, fetch, download and file/URI sinks;
- parser/consumer paths for queries, templates, commands, serialization, URLs, archives, documents/media and other evidenced transformations.

Trace source-to-transform-to-sink or subject-to-decision-to-consequence paths rather than matching dangerous words. Establish reachability and controlling context only as far as needed to define the surface; exploitability belongs to `deep-hunting`.

## Canonical surface and hunt-seed contract

For each surface record:

- stable id and fingerprint from value, decision, enforcement point, object/action, protocol and trust boundary;
- producers/consumers, components, subjects/credentials, object/action/state, channel/version, boundary and intended invariant;
- controlled inputs/identifiers, downstream sinks/consumers and a normal runtime seed or grounded dependency edge;
- evidence strategy, provenance/digests, source-to-deployment confidence, known deployment deltas and contradictions;
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
- relationship, runtime/state/channel, source/schema/code and deployment-delta frontiers are empty, precisely blocked or covered by an evidenced equivalent;
- every security-relevant reference is resolved without requiring redundant recovery of equivalent minified/generated artifacts;
- repeated representative or source-guided checks produce no unexplained decision, code path or deployment delta;
- every testable surface has a complete fingerprint, coverage matrix and executable hunt seed.

Update `target-profile.md`, `surfaces.md`, `working-state.md` and redacted artifacts. Return the chosen strategies and pivots; evidence and deployment confidence; frontier closure and unresolved items; graph/surface deltas; contradictions/blockers; and exact hunt assignments.

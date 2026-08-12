---
name: attack-surface-extraction
description: Exhaustively close the reachable first-party JavaScript graph for one authorized web application, identify server and client-side attack surfaces, trace value flows, validate declarations at runtime, and emit per-surface WSTG-v4.2 hunting plans. Use after per-host recon and whenever new code, routes, roles, states, APIs, messages, parsers, consumers, or channels appear.
---

# Attack-surface extraction

## Owner and boundary

The orchestrator runs this skill inline because it alone owns the shared security graph, `surfaces.md`, and JS/surface/hunt queues. Use tools directly for capture and local code search; do not create a second surface owner.

Consume one `extract` host/relationship item. Emit canonical attack surfaces plus executable `deep-hunting` assignments. Keep observation separate from vulnerability judgment: this skill may verify that a feature or sink exists, but it never labels it vulnerable or safe.

## Headless-first extraction loop

1. Start with the recon host record and JavaScript/manifest roots. In headless `playwright`, execute representative public and available authenticated happy paths that create, move, or expose value. Capture HTTP, redirects, WebSocket/SSE messages, job transitions, downloads, callbacks, storage changes, and downstream output.
2. Recursively collect every authorized first-party code reference reachable from:
   - HTML script tags, inline bootstrap data, import maps, module preload and asset/route manifests;
   - executed network traffic, dynamic imports, lazy chunks, framework loaders, workers, service workers, and WASM glue/modules;
   - static import/require/chunk references and `sourceMappingURL` directives in already collected code;
   - routes and feature states exposed by the executed application, including error, empty, alternate-role, and post-login paths available to owned fixtures.
3. Scope-check each new host before fetching. Fetch each new script/manifest/map once with provenance and a digest, inspect it, enqueue newly referenced first-party code, and continue until the queue is empty. Re-run representative paths once after apparent closure; any new first-party code or feature reopens collection.
4. Build the security graph and canonical operations/flows from both runtime and code evidence. Trace attacker-controlled data and identifiers through client normalization, request construction, authorization/validation, API/service, queue/worker/parser/storage/cache, and downstream consumer.
5. Reconcile code with runtime. A route, literal, schema, lazy chunk, or client guard is `declared`/`inferred` until a real request, message, or state transition grounds it. Record exact role/plan/state prerequisites for genuinely gated behavior; unreached behavior is `unresolved`, not gated or absent.

## JavaScript and client-side analysis

Inspect all collected code for:

- routes, hidden features, API versions, REST/GraphQL operations, WebSocket/SSE endpoints/messages, content types, batch/async behavior, identifier transports, signed capabilities, storage/CDN paths, and producer/consumer relationships;
- auth/session/tenant context, role and feature gates, state machines, retry/replay/cancel paths, client-enforced restrictions, request signing, token placement, and trust decisions that require server verification;
- attacker-controlled sources such as URL/query/fragment, referrer, DOM/input, `postMessage`, storage, cookies, server/API data, WebSocket messages, and cross-origin content;
- security-relevant sinks such as HTML/URL/script/style insertion, navigation/open redirect, `eval`/Function/string timers, dynamic script loading, DOM clobbering-sensitive lookup, `postMessage`, browser storage, service workers, WebSocket construction, fetch/XHR, downloads, and file/URI handling;
- client-side WSTG surfaces including DOM XSS, JavaScript execution, HTML injection, client-side redirects, CSS injection, resource manipulation, CORS, clickjacking, WebSockets, web messaging, browser storage, XSSI, and other applicable client/browser trust boundaries.

Trace source-to-transform-to-sink paths rather than matching dangerous words. Validate reachability and controlling context headlessly with fresh owned markers only when needed to establish the surface. Testing exploitability and impact belongs to `deep-hunting`.

## Canonical surface contract

One surface is one security decision over an operation/flow; it may span multiple hosts. For each surface record:

- stable id; serving/consuming hosts and components; runtime entry path;
- subjects/credentials, object/action/state, channel, boundary, intended invariant;
- controlled inputs/identifiers and their downstream consumers/sinks;
- observed happy path and redacted request/message/state evidence;
- JavaScript provenance: file/digest/caller plus source/transform/sink trace where client-side;
- exact role/state/channel knowledge status: `observed`, `declared`, `inferred`, `gated`, or `unresolved`;
- applicable WSTG-v42 ids/categories, why each applies, required fixtures/controls, and target-specific hypotheses beyond WSTG;
- unknowns, contradictions, next test question, and reopen condition.

Keep variants together only when evidence shows the same implementation and security decision. Split different actions, versions, channels, role/state enforcement, parsers, or trust boundaries. Similar names are insufficient for deduplication.

## Tool routing

- Use headless `playwright` for all normal browsing, network capture, lazy feature activation, DOM execution, storage, workers, service workers, downloads, redirects, and multi-user state.
- Use `playwright-headed` only after one controlled headless retry shows an exact UI/browser limitation or when operator interaction is unavoidable. Record why, complete only that interaction, then return to headless. Never use headed mode to bypass verification.
- Use `rg` on collected assets to find imports/chunks, routes, operations, identifiers, gates, sources, transforms, sinks, messages, and prerequisites. Preserve file/digest/line evidence.
- Use `sourcemapper -url <public-map-url> -output <artifact-dir>` or `-jsurl <public-js-url>` only for a map referenced by the scoped application. Recovered source remains `declared`/`inferred` until runtime grounds it.
- Use the smallest semantics-preserving in-browser or protocol request only to establish a missing surface fact. `ffuf` belongs to the recon sensitive-file baseline; do not run `sqlmap` or payload hunting during extraction. Use `interactsh-client` only when a normal owned feature's callback is required to prove a producer/consumer edge; a callback proves reachability only.

Keep secret-bearing browser state inside tools. For every action record host, role/fixture label, entry action, material options, artifact/request id, and the uncertainty resolved.

## Closure and output

Reachable-JavaScript closure for the reviewed roles/states requires:

- every known first-party script, import, chunk, manifest, worker/service-worker, WASM loader/module, and referenced source map is fetched, classified, or has an exact scope/gate/blocker;
- the recursive reference queue is empty and a repeated representative path pass produces no unexplained new first-party code;
- every runtime operation/message and every credible client-side source-to-sink path maps to a canonical surface or a documented non-security/dead-code rationale;
- each testable surface has an applicable WSTG plan and at least one queued hunt assignment; unavailable roles/plans/states remain explicit.

Update `target-profile.md`, `surfaces.md`, `working-state.md`, and redacted artifacts. Return host/roles/states exercised, JS closure summary and unresolved references, graph/surface deltas, source-to-sink traces, contradictions, blockers, applicable WSTG plans, target-specific hypotheses, and exact hunt assignments.

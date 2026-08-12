---
name: recon-pipeline
description: Continuously turn authorized scope into a verified per-host/service queue, run a lightweight web baseline including sensitive-file checks and JavaScript roots, map relationships, and route new work to extraction. Use at engagement start, for every new scoped host/service, after discoveries, and for the final incremental recon refresh.
---

# Recon pipeline

## Owner and boundary

The orchestrator may run this method inline or assign one scoped host or passive discovery population to `recon-agent`. A delegated agent writes only raw redacted artifacts and proposes deltas; the orchestrator alone updates the host/surface queues and `target-profile.md`.

Recon discovers and verifies breadth. It does not perform authenticated role/state extraction, broad vulnerability fuzzing, candidate validation, or safety claims.

## Continuous queue loop

1. Read original scope and carve-outs. Expand only authorized wildcard/CIDR populations. A discovered node stays `candidate-scope` until its ownership and matching scope rule are evidenced.
2. Run passive discovery for authorized root/wildcard inputs, preserve provenance, and enqueue every new candidate. Repeat incrementally after new relationships appear and once when all other queues appear drained.
3. For each verified in-scope host/service, run the smallest applicable baseline below. Split hosts that differ in DNS/TLS, application behavior, identity realm, consumer/provider role, or technology; a shared template never proves shared security behavior.
4. Record host/service and relationship deltas, then route value-bearing web applications and unresolved trust edges to `attack-surface-extraction`.
5. Continue until the current host queue is drained. `defer` changes priority but remains queued and cannot satisfy closure.

## Per-host web baseline

For every verified scoped web host:

1. Resolve DNS, inspect certificate/SAN and redirect behavior, then verify HTTP with a real fetch. Preserve scheme, port, status, title, technology hints, final location, representative body signature, wildcard/soft-404 behavior, and ownership contradictions.
2. For a browser-capable application, open one representative public path with headless Playwright. Capture redirect/identity realm, first-party origins, initial network exchanges, HTML script/import-map/manifest references, workers/service workers, and obvious API/storage/CDN relationships. For an API-only service, use a real HTTP request and record that no browser entry is evidenced. Authenticated feature walking belongs to extraction.
3. Run one non-recursive, normally unauthenticated, GET-only sensitive-resource baseline aligned with WSTG-v42 INFO/CONF using `.claude/skills/recon-pipeline/assets/sensitive-baseline.txt`: the vendored 5,384-entry Bo0oM `fuzz.txt` pinned in `tools.lock.json`. Pass its path directly to `ffuf`; do not load it into model context. Do not attach session cookies, send bodies, or follow redirects off the scoped host. Add only technology- or evidence-derived paths and backup forms such as an observed filename plus `.bak`, `.old`, `~`, `.zip`, or `.map`; never build a Cartesian wordlist.
4. Calibrate against at least two impossible paths and compare status, redirect, content type, size, stable body structure, and title. Treat generic 200s, branded 404s, WAF pages, redirects, and empty bodies as noise until manually distinguished. Inspect only the minimum response needed to classify exposure; redact secrets immediately.
5. A security-relevant `401` or `403` is a follow-up signal, not absence. First distinguish application authorization from authentication failure, WAF/gateway denial, soft-404 behavior, and a nonexistent resource. Only when existence or relevance is grounded by a link/code reference, positive sibling, distinctive denial, or other target evidence, run at most eight one-axis variants selected from: segment or extension case; one percent-encoded dot or separator at the suspected proxy/application boundary; one redundant separator, dot segment, or trailing path form; or an observed equivalent method, route, API version, or rewrite header. Do not generate casing powersets, recursively encode, spray trusted headers, or apply variants to every wordlist entry. A differential response reopens extraction or the applicable WSTG authorization/parser test; it is not a finding by itself.
6. For each server-side script filename actually observed in HTML, JavaScript, errors, manifests, source maps, or normal traffic, test at most two mixed-case extension variants when a handler, proxy, CDN, or filesystem case boundary is plausible (for example `.php` versus `.pHp`). Compare against the normal script and an impossible sibling. Treat raw source, a changed content type, or handler bypass as a candidate signal requiring controlled validation; never enumerate case permutations over guessed filenames.
7. Record every first-party JavaScript/manifest root for extraction. Do not claim JS coverage from the landing page alone.

If direct checks confirm exposed `.git`, use `git-dumper` only on that scoped path and retain the minimum evidence necessary. Never start it from a status code or guessed technology alone.

## Tool routing

- Use `subfinder -d <root> -silent -o <artifact>` for passive wildcard hostname candidates. Do not probe a candidate before scope/ownership is established.
- Use DNS/TLS inspection followed by `httpx -l <scoped-input> -t 10 -rl 5 -json -sc -title -td -location -o <artifact>` for bounded live verification; lower limits to program rules.
- Use `naabu` only when the scope explicitly authorizes port discovery. Prefer named or small port sets, save JSON, and verify material results with the real protocol.
- Use headless `playwright` for representative browser behavior and network/JavaScript roots. Do not use `playwright-headed` during ordinary recon.
- Use `ffuf` only with the vendored sensitive baseline plus evidence-derived sensitive paths: one scoped base URL, no recursion, `-mc all -t 5 -rate 5 -maxtime 1800`, calibrated filters, and JSON output. Preserve meaningful `401/403` results for the bounded follow-up above. Stop on instability, rate limiting, repeated soft-404 behavior, or exhausted list. Do not use `sqlmap` or `interactsh-client` for generic recon.

For every run preserve normalized inputs, exact command/MCP action, version, rate/concurrency, timestamps, failures, calibration, and raw redacted output. Empty output is bounded to that input, method, and time.

## Status, handoff, and output

Keep completion separate from routing:

- `work_status`: `continue` while recon work remains, `recon-bounded` when the assigned baseline/pass is complete for its observed behavior and time, `out-of-scope` when evidence excludes the node, or `blocked` for an exact operator-only prerequisite;
- `handoff`: `extract` for a verified in-scope web application/value edge, otherwise `none`;
- `candidate-scope` nodes remain separate no-traffic queue items until ownership and a matching scope rule are resolved;
- `defer` is only a scheduler priority flag with a revisit trigger and never a terminal work status.

When inline, update `target-profile.md` and queues. When delegated, return exactly: assignment id; scope touched; mechanics/tool data; verified node/edge deltas and provenance; per-host baseline results; sensitive-resource classifications; JavaScript/manifest roots; behavioral clusters and unsampled uncertainty; contradictions; `work_status`; `handoff`; candidate-scope nodes; defer/reopen conditions; and ranked extraction questions.

Recon is ready for closure only when every original scope population and discovered scoped host/service has terminal work status, every verified web host has the baseline or an exact blocker, no testable `defer` or unresolved `candidate-scope` remains, and a final incremental pass yields no new scoped node, relationship, sensitive resource, or JavaScript root.

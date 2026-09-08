# Stop merging upstream; treat mattpocock/skills as a read-only reference

This repo began as a tracking fork of [mattpocock/skills](https://github.com/mattpocock/skills), with periodic merges from `upstream/main`. Three things changed the economics of those merges:

- The capsule rename (see `.agents/adr/0003-rename-module-to-capsule.md`) rewrote the files upstream edits most (`codebase-design`, `improve-codebase-architecture`, `tdd`, and their docs pages), so every future merge conflicts exactly where upstream is most active.
- Divergence is accelerating on two axes: the skills are being retargeted at a Python framework for RTL automation, and at corporate flows. Edit coverage will approach all of the skills that stay linked.
- This repo's consumption model is manual cherry-picking: individual skills are symlinked into the local harness when they earn it. The fork is used as a menu, not redistributed as a plugin, so upstream's repo-wide invariants (README/plugin/docs sync, router accuracy across the full set) serve a distribution model this repo does not have.

Merging pays off when most of an incoming diff lands untouched. Under the conditions above, each merge trends toward manually re-reviewing and rewriting upstream's diff anyway, at which point hand-porting costs the same and the merge machinery only adds conflict overhead. Skills are prose files with no dependency graph, build, or tests binding them, so per-file porting works where it would not for a code library.

## Decision

Merge commit `02616f0` (upstream `3cca18b`, merged 2026-09-07) is the **last upstream merge**. From now on:

- The `upstream` remote is kept as a read-only reference: fetch and read it, never merge it.
- **New upstream skills** come in by directory copy, followed by an import pass: sweep the vocabulary into this repo's glossary (module, component, service, boundary into capsule, seam, etc. per `CONTEXT.md`), strip TypeScript assumptions, then link if wanted.
- **Fixes to kept skills** come in by per-file diff (`git fetch upstream && git diff HEAD upstream/main -- skills/<name>`) and are hand-ported when worth it.
- Upstream attribution and the LICENSE are retained regardless of divergence.

## Consequences

- Passive improvement is lost: a kept-but-unrevisited skill stays frozen with whatever flaws it has. Accepted, since the linked set is small and actively curated.
- Machinery that existed to stay merge-compatible or to distribute (changesets and the release flow, plugin manifests, docs-page sync rules, routes to unused skills) is no longer required and may be pruned in a follow-up.
- Reversing this later means re-merging across an ever-larger divergence; the decision gets more locked-in with time, which is why it is recorded here.

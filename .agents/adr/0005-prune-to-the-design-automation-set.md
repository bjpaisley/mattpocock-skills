# Prune the library to the mixed-signal design-automation set

With upstream merges ended (see `.agents/adr/0004-stop-merging-upstream.md`), this repo is a curated personal library targeting mixed-signal semiconductor work: digital design automation and RTL generation, in Python, consumed via cherry-picked symlinks. Everything that only served upstream's distribution model or workflows outside that target was deleted. Git history and the read-only `upstream` remote preserve all of it, so any deletion is recoverable.

Deleted:

- **Buckets**: `skills/in-progress/` (TypeScript-only `setup-ts-deep-modules`, the `writing-*` article pipeline, and experiments: `claude-handoff`, `loop-me`, `implement-spec`, the `retro` stub), `skills/misc/` (upstream's course and migration tooling), and the empty `skills/deprecated/`.
- **`prototype`'s UI branch** (`UI.md`): web-app UI variation prototyping. The logic branch (shareable HTML state-model demos) stays.
- **Distribution machinery**: `.claude-plugin/` (plugin and marketplace manifests), `package.json`/`package-lock.json`, `.changeset/` and the release flow, `scripts/sync-plugin-version.mjs`, `CHANGELOG.md`, `.agents/install-block.md`.
- **The `docs/` tree and `.agents/writing-docs.md`**: the per-skill docs pages mirrored upstream's published site and answered upstream's community; each `SKILL.md` is now the single source of truth.

All seven `skills/productivity/` skills and all `skills/engineering/` skills were kept. `ask-matt` and `setup-matt-pocock-skills` are kept pending a rename and rewrite for the reduced set.

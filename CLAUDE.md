Skills are organized into bucket folders under `skills/`:

- `engineering/`: daily code work
- `productivity/`: daily non-code workflow tools

Every skill must have an entry in its bucket's `README.md`, with the skill name linked to its `SKILL.md`, grouped into
**User-invoked** and **Model-invoked**. The top-level `README.md` lists skills by name only; keep its lists in sync
when adding, renaming, or removing a skill.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus
`policy.allow_implicit_invocation: false` in `agents/openai.yaml`, reachable only by the human) or model-invoked
(model- or user-reachable). See [.agents/invocation.md](./.agents/invocation.md).

[`skill-map`](./skills/engineering/skill-map/SKILL.md) is the router that maps every user-reachable skill and how they
relate. Whenever you add, rename, remove, or change how a user-reachable skill fits the flows, re-read `skill-map`'s
`SKILL.md` and update it so the map stays accurate: a new skill it never mentions, or a stale one it still routes to,
is a router that lies.

This is a curated personal library targeting mixed-signal design automation and RTL generation, primarily in Python.
Upstream (`mattpocock/skills`, the `upstream` remote) is a read-only reference and is never merged; see
`.agents/adr/0004-stop-merging-upstream.md`. To import an upstream skill: copy its directory, sweep its vocabulary to
this repo's glossary (`CONTEXT.md`; the unit of code design is a **capsule**, never "module", per
`.agents/adr/0003-rename-module-to-capsule.md`), strip TypeScript assumptions, then sync the bucket README, the
top-level README, and `skill-map`.

Skills are consumed by symlinking a curated subset into the local harness skill directories (`~/.claude/skills`,
`~/.agents/skills`): edit `scripts/linked-skills.txt`, then run `scripts/link-skills.sh`. Re-run it after renaming a
linked skill.

No em-dashes anywhere in this repo's prose (`SKILL.md` files, `README.md`, ADRs, code comments). Where a sentence
reaches for one, rewrite it instead with a comma, colon, period, parentheses, or a conjunction, whichever the sentence
actually wants; never do a blind character substitution.

Use a 120-character column limit in code, scripts, and prose.

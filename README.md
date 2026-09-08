# Design Automation Skills

A curated agent-skill library for mixed-signal semiconductor work: digital design automation and RTL generation,
primarily in Python. Forked from [mattpocock/skills](https://github.com/mattpocock/skills) and now maintained
independently as a personal library (MIT, see [LICENSE](./LICENSE)).

## How the library is consumed

Skills are symlinked individually into the local harness skill directories (`~/.claude/skills` for Claude Code,
`~/.agents/skills` for other Agent Skills harnesses). Edit [`scripts/linked-skills.txt`](./scripts/linked-skills.txt)
(one skill name per line), then run:

```bash
scripts/link-skills.sh
```

Each link points into this repo, so a `git pull` keeps linked skills current. In each target repo, run `/setup-skills`
once to configure the issue tracker, triage labels, and domain-doc layout the engineering skills assume.

## Skills

Every skill is either **user-invoked** (reachable only when you type it) or **model-invoked** (the agent can also
reach for it when the task fits); see [.agents/invocation.md](./.agents/invocation.md). When unsure which skill fits a
situation, `/skill-map` is the router over the whole set.

- **[Engineering](./skills/engineering/README.md)**: skill-map, grill-with-docs, triage,
  improve-codebase-architecture, setup-skills, to-spec, to-tickets, implement, wayfinder (user-invoked); prototype,
  diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts, wizard
  (model-invoked).
- **[Productivity](./skills/productivity/README.md)**: grill-me, handoff, teach, to-questionnaire, wait-what
  (user-invoked); grilling, writing-for-agents (model-invoked).

Each bucket README carries the one-line description of every skill.

## Divergences from upstream

Upstream is a read-only reference and is never merged (see
[ADR 0004](./.agents/adr/0004-stop-merging-upstream.md)). The notable divergences:

- The design vocabulary's central term is **capsule**, not "module", because "module" is overloaded in this library's
  target codebases (a Python import unit, a Verilog design unit). See
  [ADR 0003](./.agents/adr/0003-rename-module-to-capsule.md) and [CONTEXT.md](./CONTEXT.md).
- The library was pruned to this flow's needs: TypeScript-specific skills, upstream's distribution machinery, and the
  per-skill docs mirror are gone. See [ADR 0005](./.agents/adr/0005-prune-to-the-design-automation-set.md).
- `ask-matt` is now `skill-map`; `setup-matt-pocock-skills` is now `setup-skills`.
- `prototype` is logic-only; the web-UI variation branch was removed.

New upstream skills can still be imported: copy the skill directory, sweep its vocabulary to this library's glossary,
strip TypeScript assumptions, then add it to a bucket README and `skill-map`.

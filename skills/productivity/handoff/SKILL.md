---
name: handoff
description: Compact the current conversation into a handoff document for another agent to pick up.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff document summarising the current conversation so a fresh agent can continue the work. Save to the workspace root as `HANDOFF.md`; if one already exists from a previous session, rename it to `HANDOFF-YYYY-MM-DD-<short-topic>.md` rather than overwriting, and reference it from the new document.

Choose the format and sections yourself, based on the style and context of the session - lead with what matters most for the next agent (e.g. a pivot, a decision, a blocker).

Include a "suggested skills" section in the document, naming which skills the next agent should call the Skill tool for.

Do not duplicate content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs). Reference them by path or URL instead.

Redact any sensitive information, such as API keys, passwords, or personally identifiable information.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the doc accordingly.

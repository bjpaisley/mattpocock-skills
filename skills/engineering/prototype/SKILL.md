---
name: prototype
description: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right.
---

# Prototype

A prototype is **throwaway code that answers a question**: "Does this logic / state model feel right?"

## The shape

Follow [LOGIC.md](LOGIC.md): build a single shareable HTML file (free-play buttons plus tabbed guided walkthroughs) that pushes the state machine through cases that are hard to reason about on paper, and that a non-developer can drive. State the question being answered at the top of the prototype.

## Rules

1. **Throwaway from day one, and clearly marked as such.** Locate the prototype code close to where it will actually be used (next to the capsule it's prototyping for) so context is obvious, but name it so a casual reader can see it's a prototype, not production.
2. **Trivial to run.** A logic demo is a single HTML file the user double-clicks. No thinking required to start it.
3. **No persistence by default.** State lives in memory. Persistence is the thing the prototype is _checking_, not something it should depend on. If the question explicitly involves a database, hit a scratch DB or a local file with a clear "PROTOTYPE, wipe me" name.
4. **Skip the polish.** No tests, no error handling beyond what makes the prototype _runnable_, no abstractions. The point is to learn something fast.
5. **Surface the state.** After every action, render the full relevant state so the user can see what changed.
6. **Capture it when done.** Fold any validated decision into the real code, then capture the prototype itself as a **primary source**: commit it to a throwaway branch, out of main, and leave a context pointer to that branch on the implementation issue. Capture the answer too (the verdict and the question it settled) in the issue or a commit. The main branch keeps only the validated decision.

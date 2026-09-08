# CONTEXT.md Format

## Structure

```md
# {Context Name}

{One or two sentence description of what this context is and why it exists.}

## Language

**Module**:
{A one or two sentence description of the term}
_Avoid_: block, design unit ("Python module", written in full, when the import unit is meant)

**Net**:
A named electrical connection between Ports.
_Avoid_: wire, signal

**Instance**:
A single placement of a Module inside a parent Module.
_Avoid_: cell, occurrence
```

## Rules

- **Be opinionated.** When multiple words exist for the same concept, pick the best one and list the others under `_Avoid_`.
- **Keep definitions tight.** One or two sentences max. Define what it IS, not what it does.
- **Only include terms specific to this project's context.** General programming concepts (timeouts, error types, utility patterns) don't belong even if the project uses them extensively. Before adding a term, ask: is this a concept unique to this context, or a general programming concept? Only the former belongs.
- **Group terms under subheadings** when natural clusters emerge. If all terms belong to a single cohesive area, a flat list is fine.

## Single vs multi-context repos

**Single context (most repos):** One `CONTEXT.md` at the repo root.

**Multiple contexts:** A `CONTEXT-MAP.md` at the repo root lists the contexts, where they live, and how they relate to each other:

```md
# Context Map

## Contexts

- [Parsing](./src/parsing/CONTEXT.md): reads source RTL and specs into the design database
- [Connecting](./src/connecting/CONTEXT.md): builds the Module hierarchy and wires Nets between Instances
- [Rendering](./src/rendering/CONTEXT.md): emits generated RTL from the connected design

## Relationships

- **Parsing → Connecting**: Parsing populates the design database; Connecting consumes it to build the hierarchy
- **Connecting → Rendering**: Connecting produces the resolved hierarchy; Rendering emits it as Verilog
- **Parsing ↔ Rendering**: Shared types for `ModuleRef` and `PortDirection`
```

The skill infers which structure applies:

- If `CONTEXT-MAP.md` exists, read it to find contexts
- If only a root `CONTEXT.md` exists, single context
- If neither exists, create a root `CONTEXT.md` lazily when the first term is resolved

When multiple contexts exist, infer which one the current topic relates to. If unclear, ask.

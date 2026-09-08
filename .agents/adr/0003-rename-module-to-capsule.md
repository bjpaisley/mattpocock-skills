# Rename the code-design term "module" to "capsule"

Upstream's `codebase-design` glossary defines **module** (Ousterhout's deep-module sense) as its central term: anything with an interface and an implementation, scale-agnostic. The term is load-bearing across the skill set: `improve-codebase-architecture` enforces it by name in its report tone rules, and `tdd`, `to-spec`, `code-review`, `diagnosing-bugs`, `ask-matt`, `prototype`, and `setup-ts-deep-modules` all speak it.

This fork's skills run against Python frameworks for RTL automation, where "module" is doubly taken:

- **Python**: a module is a file-level import unit. Conflating it with the glossary term is a granularity blur; an agent anchors the design unit to files and misses function-, class-, or package-scale seams. Annoying but recoverable.
- **Verilog/SystemVerilog**: a module is a hardware design unit, and in RTL automation it is the *data the code manipulates* (`Module` classes, `top_module` variables, hierarchy walkers). A skill instruction like "where are modules shallow?" has a fully coherent, completely wrong reading in which the agent assesses the design under automation instead of the Python code doing the automating. This referent swap is the dangerous collision, and it is self-reinforcing because a Verilog module's port list is literally called its interface, so "the module's interface" parses perfectly as an RTL sentence.

## Decision

Rename the glossary term to **capsule** throughout the fork's skills, docs pages, READMEs, and doc-authoring guide. The definition line carries an "_(upstream: module)_" marker, and "module" joins the term's `_Avoid_` list with the overload spelled out, so agents both use the new term and know what to do when they meet the old one.

Alternatives considered and rejected:

- **abstraction**: faithful to Ousterhout ("deep abstractions"), but overused in casual speech so it will not stay reserved, and it soft-collides with "abstraction level" (RTL vs gate) in EDA conversation.
- **facility**, **crate**: usable but weaker ("deep facility" reads awkwardly; "crate" carries a strong Rust association).
- Nearly every generic "chunk" noun is existing EDA vocabulary and unusable in this fork's context: block, cell, core, unit, macro, tile, partition, island, domain, cluster, subsystem, fabric.
- **unit**, **component**, **service** were already banned by the upstream glossary itself.

"Capsule" names the exact property the glossary protects (encapsulation: a lot of machinery sealed behind a small opening), takes "deep"/"shallow" naturally, has no Python, Verilog, SystemVerilog, or EDA meaning, and is distinctive enough that grep finds every use.

## Deliberately untouched

- Direct quotations: the Ousterhout quote in `README.md`, GitHub issue and reply quotes in the docs pages.
- `CHANGELOG.md` (historical record).
- JavaScript/TypeScript language keywords: `<script type="module">`, `module.exports`, `"type": "module"`.
- The `setup-ts-deep-modules` skill name, folder, and display name (its prose now says capsule; renaming the skill itself would widen the upstream diff for little gain).
- Upstream URLs (aihero.dev docs links, github.com/mattpocock/skills blob links).

## Consequences

Every future upstream merge will conflict wherever Matt edits sentences containing "module" in the renamed files; the "(upstream: module)" marker in the glossary and this ADR are what keep those conflicts decipherable. The trade was accepted because the referent-swap hazard lands in exactly the codebases this fork exists to serve.

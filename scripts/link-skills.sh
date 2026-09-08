#!/usr/bin/env bash
set -euo pipefail

# Links the curated skills named in scripts/linked-skills.txt into the local skill
# directories used by each agent harness:
#   - ~/.claude/skills: Claude Code
#   - ~/.agents/skills: Codex and other Agent Skills-compatible harnesses
# Each entry is a symlink into this repo, so a `git pull` is all that's needed to keep
# linked skills up to date. Edit linked-skills.txt to change the set, then re-run.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
LIST="$REPO/scripts/linked-skills.txt"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

names=()
srcs=()
while IFS= read -r name; do
  case "$name" in '' | '#'*) continue ;; esac
  src=""
  for bucket in "$REPO"/skills/*/; do
    if [ -f "$bucket$name/SKILL.md" ]; then
      src="$bucket$name"
      break
    fi
  done
  if [ -z "$src" ]; then
    echo "warning: skill '$name' not found under skills/; skipping" >&2
    continue
  fi
  names+=("$name")
  srcs+=("$src")
done <"$LIST"

for DEST in "${DESTS[@]}"; do
  # If $DEST is a symlink that resolves into this repo, we'd end up writing the per-skill
  # symlinks back into the repo's own skills/ tree. Detect and bail out instead of
  # polluting the working copy.
  if [ -L "$DEST" ]; then
    resolved="$(readlink -f "$DEST")"
    case "$resolved" in
    "$REPO" | "$REPO"/*)
      echo "error: $DEST is a symlink into this repo ($resolved)." >&2
      echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
      exit 1
      ;;
    esac
  fi

  mkdir -p "$DEST"

  for i in "${!names[@]}"; do
    name="${names[$i]}"
    src="${srcs[$i]}"
    target="$DEST/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done

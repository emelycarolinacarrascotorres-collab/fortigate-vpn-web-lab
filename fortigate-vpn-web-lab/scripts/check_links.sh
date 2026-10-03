#!/usr/bin/env bash
# Script GENERADO durante la documentación (no usado en el laboratorio).
cd "$(dirname "$0")/.." || exit 1
fail=0
while IFS= read -r f; do
  d=$(dirname "$f")
  grep -oE '\]\(([^)#]+)(#[^)]*)?\)' "$f" | sed -E 's/^\]\(([^)#]+).*/\1/' | while read -r l; do
    case "$l" in http*|mailto:*) continue;; esac
    [ -e "$d/$l" ] || { echo "BROKEN: $f -> $l"; echo x > /tmp/_broken; }
  done
done < <(find . -name '*.md')
[ -e /tmp/_broken ] && { rm /tmp/_broken; exit 1; } || echo "OK: no broken relative links"

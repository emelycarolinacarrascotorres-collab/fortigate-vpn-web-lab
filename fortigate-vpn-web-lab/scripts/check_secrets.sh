#!/usr/bin/env bash
# Script GENERADO durante la documentación (no usado en el laboratorio).
cd "$(dirname "$0")/.." || exit 1
if grep -rInE 'Cisco@[0-9]+|secret 5 \$1\$|\$1\$[A-Za-z0-9./]{4}\$|preshared|psksecret' --include='*.txt' --include='*.md' --exclude-dir=scripts . ; then
  echo "Possible secret found"; exit 1
else echo "OK: no secrets matched"; fi

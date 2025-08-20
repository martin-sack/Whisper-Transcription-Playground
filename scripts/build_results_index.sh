#!/usr/bin/env bash
set -euo pipefail

LANG_SELECTED="${1:-unspecified}"
OUT="results/README.md"

echo "# Results (language: ${LANG_SELECTED})" > "$OUT"
echo >> "$OUT"

shopt -s nullglob
for f in results/transcripts/*/*.txt; do
  rel="$f"
  bn="$(basename "$f")"
  clip="$(basename "$(dirname "$f")")"
  echo "## ${clip}/${bn}" >> "$OUT"
  echo >> "$OUT"
  echo "[Open file](${rel})" >> "$OUT"
  echo >> "$OUT"
  echo '```' >> "$OUT"
  head -c 5000 "$f" >> "$OUT"
  echo >> "$OUT"
  echo '```' >> "$OUT"
  echo >> "$OUT"
done

echo "Generated on $(date)" >> "$OUT"

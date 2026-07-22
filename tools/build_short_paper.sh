#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/papers"

mkdir -p build
pandoc STATE_AWARE_COMPUTING.md \
  --from markdown+tex_math_dollars \
  --template public_template.tex \
  --pdf-engine=xelatex \
  --resource-path=.. \
  --output build/state-aware-computing.pdf

cp build/state-aware-computing.pdf state-aware-computing.pdf
shasum -a 256 state-aware-computing.pdf > SHA256SUMS

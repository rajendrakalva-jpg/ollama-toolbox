#!/usr/bin/env bash
set -euo pipefail

MANIFEST="$(cd "$(dirname "$0")" && pwd)/model-manifest.txt"
MODEL_DIR="$(cd "$(dirname "$0")" && pwd)/models/qwen2.5:7b-instruct"

if [[ ! -f "$MANIFEST" ]]; then
  echo "Manifest not found: $MANIFEST"
  exit 1
fi

if [[ ! -d "$MODEL_DIR" ]]; then
  echo "Model directory not found: $MODEL_DIR"
  echo "Place the 7B model weights there before running Ollama."
  exit 1
fi

FILE_COUNT=$(find "$MODEL_DIR" -type f | wc -l | tr -d ' ')
BYTES=$(find "$MODEL_DIR" -type f -exec wc -c \; | awk '{sum += $1} END {print sum}')

if [[ "$FILE_COUNT" -lt 1 ]]; then
  echo "Model directory is empty."
  exit 1
fi

if [[ "$BYTES" -lt 1000000000 ]]; then
  echo "Model directory appears too small for a 7B model weights payload."
  exit 1
fi

echo "Model directory looks valid."
echo "Files: $FILE_COUNT"
echo "Bytes: $BYTES"

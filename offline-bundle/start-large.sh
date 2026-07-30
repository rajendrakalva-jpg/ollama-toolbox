#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUNDLE_DIR="$ROOT_DIR/offline-bundle"

if [[ ! -x "$BUNDLE_DIR/bin/ollama" ]]; then
  echo "Bundled Ollama binary not found at $BUNDLE_DIR/bin/ollama"
  exit 1
fi

if [[ ! -d "$BUNDLE_DIR/models/qwen2.5:7b-instruct" ]]; then
  echo "Model directory not found at $BUNDLE_DIR/models/qwen2.5:7b-instruct"
  echo "Place the 7B model weights there before starting Ollama."
  exit 1
fi

"$BUNDLE_DIR/bin/ollama" serve > /tmp/ollama.log 2>&1 &
sleep 3

echo "Offline Ollama is running."
echo "Model directory: $BUNDLE_DIR/models/qwen2.5:7b-instruct"

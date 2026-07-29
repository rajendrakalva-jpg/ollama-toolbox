#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OFFLINE_DIR="$ROOT_DIR/offline"

if [[ ! -x "$OFFLINE_DIR/bin/ollama" ]]; then
  echo "Offline Ollama binary not found at $OFFLINE_DIR/bin/ollama"
  exit 1
fi

mkdir -p "$HOME/.ollama"
cp -R "$OFFLINE_DIR/models/." "$HOME/.ollama/" 2>/dev/null || true

"$OFFLINE_DIR/bin/ollama" serve > /tmp/ollama.log 2>&1 &
sleep 3

echo "Offline Ollama is running."
echo "Try: curl http://localhost:11434/api/tags"

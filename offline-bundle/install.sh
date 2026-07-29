#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUNDLE_DIR="$ROOT_DIR/offline-bundle"

if [[ ! -x "$BUNDLE_DIR/bin/ollama" ]]; then
  echo "Bundled Ollama binary not found at $BUNDLE_DIR/bin/ollama"
  exit 1
fi

mkdir -p "$HOME/.ollama"
cp -R "$BUNDLE_DIR/bin/." "$HOME/.ollama/" 2>/dev/null || true
cp -R "$BUNDLE_DIR/models/." "$HOME/.ollama/" 2>/dev/null || true

echo "Offline bundle installed to $HOME/.ollama"

#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUNDLE_DIR="$ROOT_DIR/offline-bundle"

mkdir -p "$HOME/.ollama"

if [[ -d "$BUNDLE_DIR/bin" ]]; then
  cp -R "$BUNDLE_DIR/bin/." "$HOME/.ollama/"
fi

if [[ -d "$BUNDLE_DIR/models" ]]; then
  cp -R "$BUNDLE_DIR/models/." "$HOME/.ollama/"
fi

echo "Installed local Ollama assets to $HOME/.ollama"
echo "Expected model directory: $HOME/.ollama/models/qwen2.5:7b-instruct"

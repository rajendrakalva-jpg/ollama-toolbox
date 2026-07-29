#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OFFLINE_DIR="$ROOT_DIR/offline"

if [[ ! -d "$OFFLINE_DIR/bin" || ! -d "$OFFLINE_DIR/models" ]]; then
  echo "Offline bundle is incomplete. Add Ollama binaries and model files under offline/bin and offline/models first."
  exit 1
fi

mkdir -p "$HOME/.ollama"
cp -R "$OFFLINE_DIR/bin/." "$HOME/.ollama/" 2>/dev/null || true
cp -R "$OFFLINE_DIR/models/." "$HOME/.ollama/" 2>/dev/null || true

echo "Offline assets copied to $HOME/.ollama"

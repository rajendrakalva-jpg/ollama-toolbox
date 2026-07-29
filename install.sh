#!/usr/bin/env bash
set -euo pipefail

if [[ "$OSTYPE" == darwin* ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required. Install it first: https://brew.sh"
    exit 1
  fi
  brew install ollama
else
  echo "This installer currently targets macOS. Please install Ollama manually on your system."
  exit 1
fi

echo "Ollama installed."

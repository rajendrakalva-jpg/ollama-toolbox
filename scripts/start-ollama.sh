#!/usr/bin/env bash
set -euo pipefail

if ! command -v ollama >/dev/null 2>&1; then
  echo "Ollama is not installed. Run ./install.sh first."
  exit 1
fi

ollama serve > /tmp/ollama.log 2>&1 &
sleep 3
ollama pull qwen2.5:7b-instruct

echo "Ollama is running and the model is downloaded."
echo "Try: curl http://localhost:11434/api/tags"

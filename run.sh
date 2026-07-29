#!/usr/bin/env bash
set -euo pipefail

docker run -d --name ollama -p 11434:11434 \
  -v ollama-data:/root/.ollama \
  ollama-tooling:latest

echo "Ollama is starting on http://localhost:11434"

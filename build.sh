#!/usr/bin/env bash
set -euo pipefail

docker build -t ollama-tooling:latest .
docker save ollama-tooling:latest -o ollama-tooling.tar

echo "Built archive: ollama-tooling.tar"

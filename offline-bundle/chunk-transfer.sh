#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-./offline-bundle/models/qwen2.5:7b-instruct}"
DST_DIR="${2:-/tmp/ollama-model-transfer}"
CHUNK_SIZE_MB="${3:-2000}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Source model directory not found: $SRC_DIR"
  exit 1
fi

mkdir -p "$DST_DIR"

find "$SRC_DIR" -type f | sort | while read -r file; do
  rel_path="${file#$SRC_DIR/}"
  dest_dir="$DST_DIR/$(dirname "$rel_path")"
  mkdir -p "$dest_dir"
  cp "$file" "$DST_DIR/$rel_path"
done

echo "Model files copied to $DST_DIR"
echo "Use a file-transfer tool to move $DST_DIR to the workstation in chunks if needed."

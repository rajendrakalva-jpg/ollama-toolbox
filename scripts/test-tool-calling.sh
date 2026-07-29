#!/usr/bin/env bash
set -euo pipefail

curl http://localhost:11434/api/chat -d '{
  "model": "qwen2.5:7b-instruct",
  "messages": [
    {"role": "user", "content": "Use a tool to tell me the weather in New York."}
  ],
  "stream": false
}'

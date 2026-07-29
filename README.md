# Ollama tool-calling bundle

This bundle provides a simple way to run Ollama with a tool-capable model on a workstation.

## Included
- Ollama container image build instructions
- A model pull script for a compact tool-friendly model
- A small run script

## Recommended model
The default example uses `qwen2.5:7b-instruct`.

## Build and use

```bash
chmod +x build.sh run.sh
./build.sh
./run.sh
```

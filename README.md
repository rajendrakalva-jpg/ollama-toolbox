# Ollama toolbox

This package is ready for direct use on macOS without Docker.

## What you get
- `install.sh` installs Ollama with Homebrew
- `scripts/start-ollama.sh` starts Ollama and downloads a model
- `scripts/test-tool-calling.sh` sends a simple chat request to the local API

## Quick start

```bash
chmod +x install.sh scripts/start-ollama.sh scripts/test-tool-calling.sh
./install.sh
./scripts/start-ollama.sh
./scripts/test-tool-calling.sh
```

## Notes
- The default model is `qwen2.5:7b-instruct`
- Tool calling works through your client application by sending tool definitions to the local Ollama API


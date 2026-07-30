# Ollama toolbox

This package is designed for a restricted workstation that cannot reach public Ollama sites.

## Offline-first workflow
1. Place the local Ollama binary in `offline-bundle/bin/ollama`.
2. Place the 7B model weights for `qwen2.5:7b-instruct` in `offline-bundle/models/qwen2.5:7b-instruct/`.
3. Copy the bundle to the workstation and install it locally.
4. Start Ollama without contacting the public network.

## Files
- `install.sh` installs Ollama with Homebrew for a standard machine
- `offline-bundle/install-large.sh` copies bundled local assets into `~/.ollama`
- `offline-bundle/start-large.sh` starts the bundled Ollama binary locally
- `offline-bundle/TRANSFER.md` explains chunked transfer for a large model directory
- `scripts/test-tool-calling.sh` sends a simple local API request

## Quick start on a restricted workstation

```bash
chmod +x offline-bundle/install-large.sh offline-bundle/start-large.sh scripts/test-tool-calling.sh
./offline-bundle/install-large.sh
./offline-bundle/start-large.sh
./scripts/test-tool-calling.sh
```

## Notes
- The model directory is expected to be multi-GB for a 7B model.
- Copy the binary and model files in chunks if the transfer size is large.


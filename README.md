# Ollama toolbox

This package is designed for a restricted workstation that cannot reach public Ollama sites.

## Offline-first workflow
1. Copy your pre-downloaded Ollama binary and model files into the offline folder.
2. Run the offline installer to place them into the local Ollama home directory.
3. Start Ollama locally without contacting the public network.

## Files
- `install.sh` installs Ollama with Homebrew for a standard machine
- `offline/install-offline.sh` copies bundled local assets into `~/.ollama`
- `offline/start-offline.sh` starts the bundled Ollama binary locally
- `scripts/test-tool-calling.sh` sends a simple local API request

## Quick start on a restricted workstation

```bash
chmod +x offline/install-offline.sh offline/start-offline.sh scripts/test-tool-calling.sh
./offline/install-offline.sh
./offline/start-offline.sh
./scripts/test-tool-calling.sh
```

## Notes
- Put the real Ollama binary under `offline/bin/ollama`
- Put the model files for `qwen2.5:7b-instruct` under `offline/models/`
- This approach avoids public downloads and works entirely from the packaged local files


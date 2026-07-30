# Large offline transfer layout

This bundle is designed for a workstation that cannot reach the public internet.

## Expected contents
- `bin/ollama` : the Ollama binary
- `models/qwen2.5:7b-instruct/` : the model weights directory for the 7B model

## Size expectations
- The model weights directory is expected to be several gigabytes.
- A full 7B model can easily be around 4-6 GB depending on quantization and format.

## Copying in chunks
If the workstation cannot receive the full bundle at once, copy it in pieces:

```bash
mkdir -p /path/to/transfer/models/qwen2.5:7b-instruct
# copy the binary first
cp ./offline-bundle/bin/ollama /path/to/transfer/bin/

# copy the model directory in parts
find ./offline-bundle/models/qwen2.5:7b-instruct -type f | sort | while read -r f; do
  mkdir -p "/path/to/transfer/$(dirname "${f#./offline-bundle/}")"
  cp "$f" "/path/to/transfer/${f#./offline-bundle/}"
done
```

## Install on the workstation
```bash
mkdir -p ~/.ollama
cp -R ./offline-bundle/bin/. ~/.ollama/
cp -R ./offline-bundle/models/. ~/.ollama/
```

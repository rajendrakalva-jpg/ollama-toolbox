# Chunked transfer plan for the 7B model

Use this workflow when the model directory is too large to move in one shot.

## 1. Prepare the source side
Run the script on the machine that already has the model files:

```bash
chmod +x ./offline-bundle/chunk-transfer.sh
./offline-bundle/chunk-transfer.sh ./offline-bundle/models/qwen2.5:7b-instruct /tmp/ollama-model-transfer
```

## 2. Copy the directory in chunks
Transfer the contents of `/tmp/ollama-model-transfer` to the restricted workstation using your approved internal method, such as:
- a network share,
- a mounted drive,
- a USB disk,
- or a chunked SCP/rsync job.

## 3. Install on the workstation
Once the files arrive, run:

```bash
mkdir -p ~/.ollama/models/qwen2.5:7b-instruct
cp -R /path/to/received/models/qwen2.5:7b-instruct/. ~/.ollama/models/qwen2.5:7b-instruct/
```

## 4. Start Ollama locally
```bash
./offline-bundle/start-large.sh
```

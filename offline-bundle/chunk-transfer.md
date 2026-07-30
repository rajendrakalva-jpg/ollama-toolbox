# Chunked transfer plan for the 7B model

Use this workflow when the model directory is too large to move in one shot and the workstation can only clone the repo.

## 1. Clone the repo on the workstation
The workstation should first clone the repository:

```bash
git clone git@github.com:rajendrakalva-jpg/ollama-toolbox.git
cd ollama-toolbox
```

## 2. Prepare the model on a source machine
On a machine that already has the model files, create a local transfer directory:

```bash
chmod +x ./offline-bundle/chunk-transfer.sh
./offline-bundle/chunk-transfer.sh ./offline-bundle/models/qwen2.5:7b-instruct /tmp/ollama-model-transfer
```

## 3. Transfer the model separately
Copy the contents of `/tmp/ollama-model-transfer` to the restricted workstation using an approved local method that does not require public internet, such as:
- a USB drive,
- an internal file share,
- a mounted disk,
- or a chunked SCP/rsync job.

## 4. Install on the workstation
Once the files arrive, run:

```bash
mkdir -p ~/.ollama/models/qwen2.5:7b-instruct
cp -R /path/to/received/models/qwen2.5:7b-instruct/. ~/.ollama/models/qwen2.5:7b-instruct/
```

## 5. Start Ollama locally
```bash
./offline-bundle/start-large.sh
```

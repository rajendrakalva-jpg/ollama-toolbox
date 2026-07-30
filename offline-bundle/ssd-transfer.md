# SSD transfer workflow

Use this workflow when the model must be downloaded on a machine with access and then copied onto an SSD drive for the restricted workstation.

## 1. Download the model on a source machine
On a machine that can reach the approved source, download the model into a local directory:

```bash
mkdir -p /Volumes/SSD/ollama-models/qwen2.5:7b-instruct
# Replace this with your approved internal model download method.
```

## 2. Copy the model to the SSD drive
Copy the full model directory onto the SSD drive:

```bash
cp -R /path/to/downloaded/model /Volumes/SSD/ollama-models/qwen2.5:7b-instruct/
```

## 3. Move the SSD to the workstation
Plug the SSD into the restricted workstation and copy the model into the local Ollama path:

```bash
mkdir -p ~/.ollama/models/qwen2.5:7b-instruct
cp -R /Volumes/SSD/ollama-models/qwen2.5:7b-instruct/. ~/.ollama/models/qwen2.5:7b-instruct/
```

## 4. Start Ollama
```bash
./offline-bundle/start-large.sh
```

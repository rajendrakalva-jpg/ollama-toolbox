FROM ollama/ollama:latest

RUN /bin/sh -c 'ollama serve > /tmp/ollama.log 2>&1 & \
  sleep 10; \
  ollama pull qwen2.5:7b-instruct; \
  pkill ollama'

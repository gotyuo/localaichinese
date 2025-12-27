#!/bin/bash

echo "Stopping any existing local-ai container..."
sudo docker stop local-ai 2>/dev/null || echo "No existing local-ai container to stop"

echo "Removing any existing local-ai container..."
sudo docker rm local-ai 2>/dev/null || echo "No existing local-ai container to remove"

echo "Starting LocalAI container with deepseek-r1:8b configuration (CPU mode)..."
sudo docker run -d \
  --name local-ai \
  -p 8060:8080 \
  -v /home/hotyuo/localai-config/models:/models \
  -v /home/hotyuo/localai-config:/config \
  -e CORS_HEADERS=true \
  -e DEBUG=true \
  -e MODELS_PATH=/models \
  -e BACKENDS=llama-cpp \
  --platform linux/amd64 \
  docker.1ms.run/localai/localai:latest-cpu \
  --config-file /config/models/deepseek-r1-8b.yaml

if [ $? -eq 0 ]; then
  echo "LocalAI container started successfully!"
  echo "API endpoint: http://localhost:8060"
  echo "Test the API with: curl http://localhost:8060/v1/models"
else
  echo "Failed to start LocalAI container"
fi
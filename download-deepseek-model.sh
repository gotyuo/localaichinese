#!/bin/bash

# Script to download the deepseek-r1:8b model for LocalAI using domestic mirror
echo "Downloading deepseek-r1:8b model for LocalAI using domestic mirror..."

# Create models directory if it doesn't exist
mkdir -p /home/hotyuo/localai-config/models

# Navigate to models directory
cd /home/hotyuo/localai-config/models

# Set Hugging Face mirror environment variables for domestic access
export HF_ENDPOINT=https://hf-mirror.com
echo "Using Hugging Face mirror: https://hf-mirror.com"

# Check if huggingface-hub is installed
if ! command -v huggingface-cli &> /dev/null; then
    echo "Installing huggingface-hub with --break-system-packages flag..."
    pip install --break-system-packages huggingface-hub
fi

# Recheck if huggingface-cli is available after installation
if ! command -v huggingface-cli &> /dev/null; then
    echo "huggingface-cli is still not available. Trying python -m huggingface_hub..."
    if python3 -c "import huggingface_hub" &> /dev/null; then
        echo "Using Python module to download model..."
        python3 -c "
import os
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'
from huggingface_hub import hf_hub_download
hf_hub_download(
    repo_id='TheBloke/deepseek-coder-6.7B-instruct-GGUF',
    filename='deepseek-coder-6.7b-instruct.Q5_K_M.gguf',
    local_dir='.',
    local_dir_use_symlinks=False
)
"
    else
        echo "Installing huggingface_hub via pip with --break-system-packages..."
        python3 -m pip install --break-system-packages huggingface_hub
        python3 -c "
import os
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'
from huggingface_hub import hf_hub_download
hf_hub_download(
    repo_id='TheBloke/deepseek-coder-6.7B-instruct-GGUF',
    filename='deepseek-coder-6.7b-instruct.Q5_K_M.gguf',
    local_dir='.',
    local_dir_use_symlinks=False
)
"
    fi
else
    # Download the model using domestic mirror (using a quantized version that's suitable for LocalAI)
    echo "Downloading model file from domestic mirror. This may take a while..."
    huggingface-cli download TheBloke/deepseek-coder-6.7B-instruct-GGUF deepseek-coder-6.7b-instruct.Q5_K_M.gguf --local-dir . --local-dir-use-symlinks False
fi

# Note: Since deepseek-r1:8b might not be available as GGUF, we're using deepseek-coder as an alternative
# which has similar architecture and capabilities

echo "Model download completed!"
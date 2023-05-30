#!/usr/bin/env bash
apt install unzip
cd /workspace/stable-diffusion-webui
git checkout master
git checkout v1.3.0
cd /workspace/stable-diffusion-webui/extensions
git clone https://github.com/d8ahazard/sd_dreambooth_extension
cd /workspace/stable-diffusion-webui/extensions/sd_dreambooth_extension
source /workspace/venv/bin/activate
pip3 install --upgrade pip
pip3 install wheel
pip3 install -r requirements.txt
pip3 install -r requirements_versions.txt
cd /workspace/stable-diffusion-webui/extensions/sd_dreambooth_extension
pip3 install -r requirements.txt
pip3 install torch==1.13.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117
pip3 uninstall xformers
pip3 install https://huggingface.co/MonsterMMORPG/SECourses/resolve/main/xformers-0.0.19-cp310-cp310-manylinux2014_x86_64.whl
cd /workspace/stable-diffusion-webui

cd /workspace/stable-diffusion-webui/models/Stable-diffusion
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
cd /workspace/stable-diffusion-webui/models/VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
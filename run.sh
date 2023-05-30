#!/usr/bin/env bash
cd /workspace/stable-diffusion-webui
source /workspace/venv/bin/activate
TCMALLOC="$(ldconfig -p | grep -Po "libtcmalloc.so.\d" | head -n 1)"
echo "Using TCMalloc: ${TCMALLOC}"
export LD_PRELOAD="${TCMALLOC}"
export PYTHONUNBUFFERED=true
nohup python launch.py \
  --port 3000 \
  --listen \
  --enable-insecure-extension-access \
  --api \
  --skip-version-check \
  --ckpt-dir /workspace/stable-diffusion-webui/models/Stable-diffusion  > /workspace/log.txt &
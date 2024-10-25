git clone https://github.com/vllm-project/vllm.git &&
cd vllm &&
apt-get update && apt-get install -y --no-install-recommends curl gpg gpg-agent && \
curl https://repositories.intel.com/graphics/intel-graphics.key | gpg --dearmor --output /usr/share/keyrings/intel-graphics.gpg && \
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/graphics/ubuntu focal-legacy main' | tee  /etc/apt/sources.list.d/intel.gpu.focal.list && \
apt-get update && apt-get install -y --no-install-recommends intel-opencl-icd intel-level-zero-gpu level-zero &&
pip install --upgrade pip &&
pip install -r requirements-build.txt --extra-index-url https://download.pytorch.org/whl/cpu &&
PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cpu" VLLM_TARGET_DEVICE=openvino python -m pip install -v . &&
VLLM_OPENVINO_DEVICE=GPU VLLM_OPENVINO_ENABLE_QUANTIZED_WEIGHTS=ON \
vllm serve Qwen/Qwen2.5-1.5B-Instruct --enable-prefix-caching --enable-chunked-prefill --api-key dlkfaus89i34lk4rjlkfjs


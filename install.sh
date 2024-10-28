pip install --upgrade pip &&
python -m venv .venv &&
source .venv/bin/activate &&
pip install vllm &&
vllm serve Qwen/Qwen2.5-1.5B-Instruct \
	--enable-prefix-caching \
	--enable-chunked-prefill \
	--api-key foobarbaz

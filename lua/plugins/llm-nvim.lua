return {
  "huggingface/llm.nvim",
  opts = {
    backend = "openai",
    model = "mlx-community/Qwen2.5-Coder-3B-4bit",
    url = "http://localhost:4455/v1/completions",
    request_body = {
      max_tokens = 150,
      temperature = 0.2,
    },
    tokens_to_clear = { "<|endoftext|>", "<|fim_pad|>" },
    fim = {
      enabled = true,
      prefix = "<|fim_prefix|>",
      middle = "<|fim_middle|>",
      suffix = "<|fim_suffix|>",
    },
  },
}

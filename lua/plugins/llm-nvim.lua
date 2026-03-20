return {
  "huggingface/llm.nvim",
  opts = {
    backend = "ollama",
    model = "qwen2.5-coder:1.5b-base",
    url = "http://localhost:11434", -- llm-ls uses "/api/generate"
    -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
    request_body = {
      -- Modelfile options for the model you use
      options = {
        temperature = 0.2,
        top_p = 0.95,
      },
    },
    tokens_to_clear = { "<|endoftext|>" },
    fim = {
      enabled = true,
      prefix = "<|fim_prefix|>",
      middle = "<|fim_middle|>",
      suffix = "<|fim_suffix|>",
    },
  },
}

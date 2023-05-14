return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}

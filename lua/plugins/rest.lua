return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "http" },
  keys = {
    { "<leader>rr", "<Plug>RestNvim", desc = "Rest run" },
    { "<leader>rp", "<Plug>RestNvimPreview", desc = "Rest preview" },
    { "<leader>rl", "<Plug>RestNvimLast", desc = "Rest run last" },
  },
}

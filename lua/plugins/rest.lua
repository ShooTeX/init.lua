return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>rr", "<cmd>RestNvim<cr>", desc = "Rest run" },
    { "<leader>rp", "<cmd>RestNvimPreview<cr>", desc = "Rest preview" },
    { "<leader>rl", "<cmd>RestNvimLast<cr>", desc = "Rest run last" },
  },
}

return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>rr", "<cmd>RestNvim", desc = "Rest run" },
      { "<leader>rp", "<cmd>RestNvimPreview", desc = "Rest preview" },
      { "<leader>rl", "<cmd>RestNvimPreview", desc = "Rest run last" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "json", "html" })
      end
    end,
  },
}

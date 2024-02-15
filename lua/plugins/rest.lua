return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "http", "json" })
      end
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "http" },
    keys = {
      { "<leader>rr", "<Plug>RestNvim", desc = "Rest run" },
      { "<leader>rp", "<Plug>RestNvimPreview", desc = "Rest preview" },
      { "<leader>rl", "<Plug>RestNvimLast", desc = "Rest run last" },
    },
  },
}

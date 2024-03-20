return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  opts = function(_, opts)
    opts.adapters = vim.list_extend(opts.sources or {}, {
      require("neotest-vitest")({
        vitestCommand = "npx vitest",
      }),
    })
  end,
}

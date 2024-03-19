return {
  {
    -- "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        -- "neotest-jest",
        "neotest-vitest",
      },
    },
  },
}

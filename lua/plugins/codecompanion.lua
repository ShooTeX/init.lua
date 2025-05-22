return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        vim.cmd("CodeCompanionChat Toggle")
      end,
      desc = "Toggle (AiChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        vim.cmd("CodeCompanionActions")
      end,
      desc = "Ai Prompt",
      mode = { "n", "v" },
    },
  },
}

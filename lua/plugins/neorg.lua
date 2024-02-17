return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "norg",
  cmd = "Neorg",
  keys = {
    { "<localleader><localleader>", "<cmd>Neorg journal today<cr>", desc = "Neorg journal today" },
    { "<localleader><leader>", "<cmd>Neorg return<cr>", desc = "Neorg return" },
  },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = { -- Adds pretty icons to your documents
        config = {
          icon_preset = "diamond",
        },
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.summary"] = {},
      ["core.ui.calendar"] = {},
    },
  },
}

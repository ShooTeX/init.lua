return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          icon_preset = "diamond",
          workspaces = {
            notes = "~/notes",
            defaultWorkspace = "notes",
          },
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.presenter"] = {
        config = {
          zen_mode = "zen-mode",
        },
      },
      ["core.summary"] = {},
      ["core.ui.calendar"] = {},
    },
  },
}

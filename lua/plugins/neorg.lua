return {
  "nvim-neorg/neorg",
  enabled = false,
  lazy = false,
  version = "*",
  keys = {
    { "<localleader><localleader>", "<cmd>Neorg journal today<cr>", desc = "Neorg journal today" },
    { "<localleader><leader>", "<cmd>Neorg return<cr>", desc = "Neorg return" },
  },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            keybinds.map(
              "norg",
              "n",
              "<LocalLeader>cl",
              "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>"
            )
          end,
        },
      },
      ["core.concealer"] = { -- Adds pretty icons to your documents
        config = {
          icon_preset = "diamond",
          icons = {
            code_block = {
              conceal = true,
            },
          },
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
      ["core.summary"] = {
        config = {
          strategy = "by_path",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.ui.calendar"] = {},
    },
  },
}

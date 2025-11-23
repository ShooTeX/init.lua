return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    opts = { style = "moon" },
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        harpoon = true,
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    opts = {
      groups = {
        all = {
          TelescopeNormal = { fg = "fg1", bg = "bg0" },
          TelescopeBorder = { fg = "bg0", bg = "bg0" },

          TelescopePromptTitle = { fg = "fg1", bg = "magenta" },
          TelescopePromptBorder = { fg = "sel0", bg = "sel0" },
          TelescopePromptNormal = { fg = "fg1", bg = "sel0" },
          TelescopePromptPrefix = { fg = "fg1", bg = "sel0" },

          TelescopePreviewTitle = { fg = "black", bg = "black" },
          TelescopePreviewNormal = { fg = "bg0", bg = "black" },
          TelescopePreviewBorder = { fg = "black", bg = "black" },

          TelescopeResultsTitle = { fg = "bg0", bg = "bg0" },

          TelescopeMatching = { fg = "pink", bg = "" },
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
      background = { dark = "dragon" },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

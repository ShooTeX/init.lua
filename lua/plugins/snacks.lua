-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
  },
}

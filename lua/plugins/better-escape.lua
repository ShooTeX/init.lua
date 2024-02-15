return {
  {
    "max397574/better-escape.nvim",
    event = "BufEnter",
    keys = {
      { ";a", desc = "Better escape" },
      { "jk", desc = "Better escape" },
    },
    opts = {
      mapping = { ";a", "jk" },
    },
  },
}

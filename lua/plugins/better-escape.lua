return {
  {
    "max397574/better-escape.nvim",
    event = "BufEnter",
    keys = {
      { ";a", desc = "Better escape" },
    },
    opts = {
      timeout = vim.o.timeoutlen,
      default_mappings = false,
      mappings = {
        i = {
          [";"] = {
            a = "<Esc>",
            [";"] = "<Esc>",
          },
        },
        c = {
          [";"] = {
            a = "<Esc>",
            [";"] = "<Esc>",
          },
        },
        t = {
          [";"] = {
            a = "<Esc>",
            [";"] = "<Esc>",
          },
        },
        v = {
          [";"] = {
            a = "<Esc>",
          },
        },
        s = {
          [";"] = {
            a = "<Esc>",
          },
        },
      },
    },
  },
}

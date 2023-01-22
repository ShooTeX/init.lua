return {
  {
    "max397574/better-escape.nvim",
    keys = { { ";a", desc = "Better escape" } },
    opts = {
      mapping = { ";a" },
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
      end,
    },
  },
}

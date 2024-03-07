return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local nls = require("none-ls")
    return {
      sources = {
        nls.builtins.diagnostics.ktlint,
        nls.builtins.formatting.ktlint,
      },
    }
  end,
}

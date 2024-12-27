return {
  "mfussenegger/nvim-lint",
  opts = {
    ---@type table<string,table>
    linters = {
      oxlint = {
        cmd = "oxlint",
        stdin = false,
        args = { "--format", "unix" },
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
          source = "oxlint",
          severity = vim.diagnostic.severity.WARN,
        }),
        condition = function(ctx)
          return vim.fs.find({ "oxlintrc.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}

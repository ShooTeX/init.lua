return {
  "mfussenegger/nvim-lint",
  opts = {
    ---@type table<string,table>
    linters = {
      oxlint = {
        -- `condition` is another LazyVim extension that allows you to
        -- dynamically enable/disable linters based on the context.
        condition = function(ctx)
          return vim.fs.find({ "oxlintrc.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}

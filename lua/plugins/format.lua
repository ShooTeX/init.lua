return {
  "stevearc/conform.nvim",
  ---@param opts conform.setupOpts
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
    },
    formatters = {
      oxfmt = {
        condition = function(self, ctx)
          return vim.fs.find(
            { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" },
            { upward = true, path = ctx.dirname }
          )[1] ~= nil
        end,
      },
    },
  },
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      typescript = { "oxfmt", "biome-check" },
      typescriptreact = { "oxfmt", "biome-check" },
    },
  },
}

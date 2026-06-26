return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "detekt" } },
  },
  {
    "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      nix = { "statix" },
      kotlin = { "detekt" },
    },
  },
  },
}

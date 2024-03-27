return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = { "DbeeCreateConnection" },
  build = function()
    require("dbee").install()
  end,
  keys = {
    {
      "<leader>idb",
      function()
        require("dbee").open()
      end,
      desc = "Open dbee",
    },
  },
  opts = {},
}

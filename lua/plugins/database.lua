return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
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
}

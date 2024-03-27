return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "n",
      "<leader>edb",
      function()
        require("dbee").open()
      end,
      desc = "Open dbee",
    },
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup(--[[optional config]])
  end,
}

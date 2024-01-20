return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Harpoon append file",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")

          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon open menu",
      },
      {
        "<C-j>",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon select 1",
      },
      {
        "<C-k>",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon select 2",
      },
      {
        "<C-l>",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon select 3",
      },
      {
        "<C-h>",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon select 4",
      },
    },
    opts = {},
  },
}

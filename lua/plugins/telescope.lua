return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {

      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        LazyVim.on_load("telescope.nvim", function()
          require("telescope").load_extension("frecency")
        end)
      end,
    },
  },
  keys = {
    {
      "<leader>fr",
      "<cmd>Telescope frecency workspace=CWD path_display={'smart'} theme=ivy<cr>",
      desc = "Frecent (cwd)",
    },
    { "<leader>fR", "<cmd>Telescope frecency path_display={'smart'} theme=ivy<cr>", desc = "Frecent" },
  },
}

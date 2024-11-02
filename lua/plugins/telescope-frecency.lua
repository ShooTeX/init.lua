return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension("frecency")
  end,
  keys = {
    {
      '<leader>fr"',
      "<cmd>Telescope frecency workspace=CWD path_display={'shorten'} theme=ivy<cr>",
      desc = "Frecent (cwd)",
    },
    { '<leader>fR"', "<cmd>Telescope frecency path_display={'shorten'} theme=ivy<cr>", desc = "Frecent" },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          --auto close
          require("neo-tree").close_all()
        end,
      },
    },
  },
}

local function split(fn)
  return function()
    require("smart-splits")[fn]()
  end
end

return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
  },
  opts = {
    mux = { backend = "smart-splits-backend-tmux" },
  },
  keys = {
    { "<C-h>", split("move_cursor_left"), desc = "Move left" },
    { "<C-j>", split("move_cursor_down"), desc = "Move down" },
    { "<C-k>", split("move_cursor_up"), desc = "Move up" },
    { "<C-l>", split("move_cursor_right"), desc = "Move right" },
    { "<A-H>", split("resize_left"), desc = "Resize left" },
    { "<A-J>", split("resize_down"), desc = "Resize down" },
    { "<A-K>", split("resize_up"), desc = "Resize up" },
    { "<A-L>", split("resize_right"), desc = "Resize right" },
  },
}

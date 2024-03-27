return {
  "kndndrj/nvim-dbee",
  cmd = "DbOpen",
  opts = function()
    vim.api.nvim_create_user_command("DbOpen", function()
      require("dbee").open()
    end, {})
  end,
}

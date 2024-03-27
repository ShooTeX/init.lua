vim.api.nvim_create_user_command("DbOpen", require("dbee").open())

return {
  "kndndrj/nvim-dbee",
  cmd = "DbOpen",
}

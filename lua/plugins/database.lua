vim.api.nvim_create_user_command("DbOpen", function()
  require("dbee").open()
end, {})

return {
  "kndndrj/nvim-dbee",
}

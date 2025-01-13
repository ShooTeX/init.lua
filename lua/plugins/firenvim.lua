if vim.g.started_by_firenvim == true then
  vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
      [".*"] = {
        -- selector = "textarea",
        -- cmdline = "neovim",
        takeover = "never",
      },
    },
  }
end

return {
  enabled = false,
  "glacambre/firenvim",
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
}

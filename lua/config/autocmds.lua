-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("stx_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "norg" },
  callback = function()
    -- setup softwrap, breaking between words and
    -- indenting nicely paragraphs, lists, TODO
    vim.opt.wrap = true
    vim.opt.linebreak = true -- break on words
    vim.opt.breakindent = true -- align wrapped line with previous indent level
    vim.opt.breakindentopt = "list:-1"
    vim.opt.formatlistpat = "^\\s*[-~>]\\+\\s\\((.)\\s\\)\\?"
    vim.opt_local.spell = true
  end,
})

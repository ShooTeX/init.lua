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

-- pull latest changes when entering a notes file
vim.api.nvim_create_autocmd("BufEnter", {
  once = true,
  group = augroup("notes_pull"),
  pattern = { vim.fn.expand("~") .. "/notes/*.norg" },
  callback = function()
    print("multi run? why?")
    vim.system({ "git", "-C", vim.fn.expand("~") .. "/notes", "pull", "--rebase", "--autostash" }, {
      stdout = function(_, data)
        if data then
          vim.notify(data, "info", { title = "Notes Sync" })
        end
      end,
      stderr = function(_, data)
        if data then
          vim.notify(data, "error", { title = "Notes Sync" })
        end
      end,
    })
  end,
})

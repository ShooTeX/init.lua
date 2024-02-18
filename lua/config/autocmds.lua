-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local a = require("plenary.async")

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

local asystem = a.wrap(vim.system, 3)

-- pull latest changes when entering a notes file
vim.api.nvim_create_autocmd("BufEnter", {
  once = true,
  group = augroup("notes_pull"),
  pattern = { vim.fn.expand("~") .. "/notes/*.norg" },
  callback = a.void(function()
    --- @type vim.SystemCompleted
    local result = asystem({ "git", "-C", vim.fn.expand("~") .. "/notes", "pull", "--rebase", "--autostash" })

    if result.code ~= 0 then
      vim.notify("Failed to pull latest changes:\n" .. result.stdout, "error", { title = "Notes Sync" })
      return
    end

    vim.notify(result.stdout, "info", { title = "Notes Sync" })
  end),
})

-- commit changes when leaving a notes file
vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup("notes_push"),
  pattern = { vim.fn.expand("~") .. "/notes/*.norg" },
  callback = function()
    -- local git_root = vim.fn.finddir(".git", ".;")
    -- local absolute_path = vim.fn.expand("%:p")
    -- print(absolute_path, git_root)
    local git_root_relative = vim.fn.finddir(".git", ".;")
    local git_root_absolute = vim.fn.fnamemodify(git_root_relative, ":p")
    local absolute_filepath = vim.fn.expand("%:p")
    local relative_filepath = absolute_filepath:sub(#git_root_absolute - 4)

    print(git_root_relative, git_root_absolute, absolute_filepath, relative_filepath)
  end,
})

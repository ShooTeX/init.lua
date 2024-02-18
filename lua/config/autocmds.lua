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
    local result = asystem(
      { "git", "-C", vim.fn.expand("~") .. "/notes", "pull", "--rebase", "--autostash" },
      { text = true }
    )

    if result.code ~= 0 then
      vim.notify("Failed to pull latest changes:\n" .. result.stdout, "error", { title = "Notes Sync" })
      return
    end

    vim.notify(result.stdout, "info", { title = "Notes Sync" })
  end),
})

local get_relative_filepath = function()
  local git_root_relative = vim.fn.finddir(".git", ".;")
  local git_root_absolute = vim.fn.fnamemodify(git_root_relative, ":p")
  local absolute_filepath = vim.fn.expand("%:p")
  return absolute_filepath:sub(#git_root_absolute - 4)
end

local get_filename = function()
  return vim.fn.expand("%:t")
end

local expand_home = function()
  return vim.fn.expand("~")
end

-- commit changes when leaving a notes file
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = augroup("notes_push"),
  pattern = { vim.fn.expand("~") .. "/notes/*.norg" },
  callback = a.void(function(e)
    local expanded_home = expand_home()
    local relative_filepath = get_relative_filepath()
    local filename = get_filename()
    --- @type vim.SystemCompleted
    local changes = asystem({
      "git",
      "-C",
      expanded_home .. "/notes",
      "status",
      "--porcelain",
      relative_filepath,
    }, { text = true })

    if changes.code ~= 0 then
      vim.notify("Failed to check for changes:\n" .. changes.stderr, "error", { title = "Notes Sync" })
      return
    end

    if changes.stdout == "" then
      return
    end

    if changes.stdout:sub(1, 2) == "??" then
      --- @type vim.SystemCompleted
      local add = asystem({ "git", "-C", expanded_home .. "/notes", "add", relative_filepath }, { text = true })
      if add.code ~= 0 then
        vim.notify("Failed to add changes:\n" .. add.stderr, "error", { title = "Notes Sync" })
        return
      end
    end

    --- @type vim.SystemCompleted
    local commit = asystem(
      { "git", "-C", expanded_home .. "/notes", "commit", relative_filepath, "-m", "Update " .. filename },
      { text = true }
    )

    if commit.code ~= 0 then
      vim.notify("Failed to commit changes:\n" .. commit.stderr, "error", { title = "Notes Sync" })
      return
    end

    --- @type vim.SystemCompleted
    local push = asystem({ "git", "-C", expanded_home .. "/notes", "push" }, { text = true })

    if push.code ~= 0 then
      vim.notify("Failed to push changes:\n" .. push.stderr, "error", { title = "Notes Sync" })
      return
    end

    vim.notify("pushed changes from: " .. filename, "info", { title = "Notes Sync" })
  end),
})

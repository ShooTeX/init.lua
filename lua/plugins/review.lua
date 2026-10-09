local function agent_pane()
  local panes = vim.fn.systemlist({ "tmux", "list-panes", "-t", vim.env.TMUX_PANE, "-F", "#{pane_id} #{@agent}" })
  for _, line in ipairs(panes) do
    local id, agent = line:match("^(%S+) (%S*)$")
    if agent == "1" then
      return id
    end
  end
end

local function send_to_agent()
  local markdown = require("review.export").deliver()
  if not markdown then
    vim.notify("No comments to send", vim.log.levels.WARN, { title = "review.nvim" })
    return
  end
  local pane = vim.env.TMUX and agent_pane()
  if not pane then
    vim.notify("No agent pane in this tmux window", vim.log.levels.WARN, { title = "review.nvim" })
    return
  end
  vim.fn.system({ "tmux", "load-buffer", "-b", "review", "-" }, markdown)
  vim.fn.system({ "tmux", "paste-buffer", "-p", "-d", "-b", "review", "-t", pane })
  vim.fn.system({ "tmux", "select-pane", "-t", pane })
  vim.notify("Sent review to agent pane " .. pane, vim.log.levels.INFO, { title = "review.nvim" })
end

local function set_zoom(zoomed)
  if not vim.env.TMUX_PANE then
    return
  end
  local flag = zoomed and "0" or "1"
  vim.fn.system({
    "tmux",
    "if",
    "-F",
    "-t",
    vim.env.TMUX_PANE,
    "#{==:#{window_zoomed_flag}," .. flag .. "}",
    "resize-pane -Z -t " .. vim.env.TMUX_PANE,
  })
end

local group = vim.api.nvim_create_augroup("review_tmux_zoom", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "CodeDiffOpen",
  callback = function()
    set_zoom(true)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "CodeDiffClose",
  callback = function()
    set_zoom(false)
  end,
})

return {
  "georgeguimaraes/review.nvim",
  version = "*",
  dependencies = {
    { "esmuellert/codediff.nvim", opts = { diff = { layout = "inline" } } },
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  opts = {
    keymaps = {
      send_sidekick = false,
    },
  },
  keys = {
    { "<leader>rr", "<cmd>Review<cr>", desc = "Review working tree" },
    { "<leader>rc", "<cmd>Review commits<cr>", desc = "Review commits" },
    { "<leader>rb", "<cmd>Review branch<cr>", desc = "Review branch" },
    { "<leader>rn", ":Review note<cr>", mode = { "n", "v" }, desc = "Review: note here" },
    { "<leader>re", "<cmd>Review edit<cr>", desc = "Review: edit comment" },
    { "<leader>rd", "<cmd>Review delete<cr>", desc = "Review: delete comment" },
    { "<leader>rx", "<cmd>Review export<cr>", desc = "Review: export" },
    { "<leader>ra", send_to_agent, desc = "Review: send to agent" },
  },
}

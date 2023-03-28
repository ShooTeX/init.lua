return {
  "echasnovski/mini.ai",
  opts = function(_, opts)
    local ai = require("mini.ai")
    opts.custom_textobjects = vim.list_extend(opts.custom_textobjects, {
      t = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    })
  end,
}

return {
  "echasnovski/mini.ai",
  opts = function()
    local ai = require("mini.ai")
    return {
      custom_textobjects = {
        t = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
      },
    }
  end,
}

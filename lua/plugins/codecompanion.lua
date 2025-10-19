return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    {
      "Davidyz/VectorCode",
      version = "*",
      -- build = "uv tool upgrade vectorcode", -- This helps keeping the CLI up-to-date
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-sonnet-4",
            },
          },
        })
      end,
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = 'cmd:op read "op://private/Anthropic API Key/credential" --no-newline',
          },
        })
      end,
    },
    extensions = {
      ---@module "vectorcode"
      vectorcode = {
        ---@type VectorCode.CodeCompanion.ExtensionOpts
        opts = {
          tool_group = {
            -- this will register a tool group called `@vectorcode_toolbox` that contains all 3 tools
            enabled = true,
            -- a list of extra tools that you want to include in `@vectorcode_toolbox`.
            -- if you use @vectorcode_vectorise, it'll be very handy to include
            -- `file_search` here.
            extras = {},
            collapse = false, -- whether the individual tools should be shown in the chat
          },
          tool_opts = {
            ---@type VectorCode.CodeCompanion.ToolOpts
            ["*"] = {},
            ---@type VectorCode.CodeCompanion.LsToolOpts
            ls = {},
            ---@type VectorCode.CodeCompanion.VectoriseToolOpts
            vectorise = {},
            ---@type VectorCode.CodeCompanion.QueryToolOpts
            query = {
              max_num = { chunk = -1, document = -1 },
              default_num = { chunk = 50, document = 10 },
              include_stderr = false,
              use_lsp = false,
              no_duplicate = true,
              chunk_mode = false,
              ---@type VectorCode.CodeCompanion.SummariseOpts
              summarise = {
                ---@type boolean|(fun(chat: CodeCompanion.Chat, results: VectorCode.QueryResult[]):boolean)|nil
                enabled = false,
                adapter = nil,
                query_augmented = true,
              },
            },
            files_ls = {},
            files_rm = {},
          },
        },
      },
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    display = {
      diff = {
        provider = "mini_diff",
      },
    },
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        vim.cmd("CodeCompanionChat Toggle")
      end,
      desc = "Toggle (AiChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        vim.cmd("CodeCompanionActions")
      end,
      desc = "Ai Prompt",
      mode = { "n", "v" },
    },
  },
}

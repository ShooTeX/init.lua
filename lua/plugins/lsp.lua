return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        mdx_analyzer = {},
        oxlint = {},
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "markdown",
            "mdx",
            "vue",
            "svelte",
            "astro",
            "html",
            "graphql",
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              extraArgs = { "+nightly" },
              checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                  "cargo",
                  "+nightly",
                  "clippy",
                  "--workspace",
                  "--message-format=json",
                  "--all-targets",
                  "--all-features",
                },
              },
            },
          },
        },
        ocamllsp = {
          mason = false,
        },
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
              },
            },
          },
        },
        svelte = {
          settings = {
            svelte = { plugin = { svelte = { format = { enable = false } } } },
          },
        },
        biome = {},
        nixd = {
          settings = {
            nixd = {
              options = {
                darwin = {
                  expr = '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.STX-MacBook-Pro.options',
                },
              },
            },
          },
        },
        nil_ls = false,
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" or client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        biome = function()
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "biome" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" or client.name == "jsonls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        tailwindcss = function(_, opts)
          local tw = LazyVim.lsp.get_raw_config("tailwindcss")
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Additional settings for Phoenix projects
          opts.settings = {
            tailwindCSS = {
              classFunctions = { "tw", "twMerge", "cva", "cvaMerge", "cn", "cnMerge", "clsx", "classNames" },
              includeLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
              },
            },
          }

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },
}

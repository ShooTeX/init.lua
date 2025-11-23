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
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              formatting = {
                command = { "nixfmt" },
              },
              options = {
                darwin = {
                  expr = string.format(
                    '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.%s.options',
                    vim.fn.hostname()
                  ),
                },
                home_manager = {
                  expr = string.format(
                    '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.%s.options',
                    vim.fn.hostname()
                  ),
                },
              },
            },
          },
        },
        statix = {},
        nil_ls = false,
      },
      setup = {
        eslint = function()
          Snacks.util.lsp.on({}, function(_, client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        biome = function()
          Snacks.util.lsp.on({}, function(_, client)
            if client.name == "biome" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" or client.name == "jsonls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        tailwindcss = function(_, opts)
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

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

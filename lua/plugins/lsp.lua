return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        mdx_analyzer = {},
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
                  expr = '(builtins.getFlake (builtins.getEnv "HOME" + "/.dotfiles")).darwinConfigurations.STX-MacBook-Pro.options',
                },
                home_manager = {
                  expr = '(builtins.getFlake (builtins.getEnv "HOME" + "/.dotfiles")).darwinConfigurations.STX-MacBook-Pro.options.home-manager.users.type.getSubOptions []',
                },
                nixos = {
                  expr = '(builtins.getFlake (builtins.getEnv "HOME" + "/.dotfiles")).nixosConfigurations.heisenberg.options',
                },
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          local function get_client(buf)
            return vim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
          end

          local formatter = LazyVim.lsp.formatter({
            name = "eslint: EslintFixAll",
            primary = false,
            priority = 200,
            filter = "eslint",
            format = function(buf)
              local client = get_client(buf)
              if client then
                local push_diagnostics =
                  vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #push_diagnostics > 0 then
                  vim.cmd("LspEslintFixAll")
                end
              end
            end,
          })

          LazyVim.format.register(formatter)
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

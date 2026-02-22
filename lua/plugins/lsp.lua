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
        biome = {
          root_dir = function(bufnr, on_dir)
            local util = require("lspconfig.util")
            local root_markers = {
              "package-lock.json",
              "yarn.lock",
              "pnpm-lock.yaml",
              "bun.lockb",
              "bun.lock",
              "deno.lock",
              "biome.json",
            }
            root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
              or vim.list_extend(root_markers, { ".git" })
            local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
            local filename = vim.api.nvim_buf_get_name(bufnr)
            local biome_config_files = { "biome.json", "biome.jsonc" }
            biome_config_files = util.insert_package_json(biome_config_files, "biomejs", filename)
            local is_buffer_using_biome = vim.fs.find(biome_config_files, {
              path = filename,
              type = "file",
              limit = 1,
              upward = true,
              stop = vim.fs.dirname(project_root),
            })[1]
            if not is_buffer_using_biome then
              return
            end
            on_dir(project_root)
          end,
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
      },
      setup = {
        eslint = function()
          Snacks.util.lsp.on({}, function(_, client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
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
        oxlint = function()
          Snacks.util.lsp.on({}, function(_, client)
            if client.name == "oxlint" then
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

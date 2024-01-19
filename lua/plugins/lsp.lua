return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,

        tsserver = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "typescript-tools" then
              client.enable = false
            end
          end)
        end,
      },
    },
  },
}

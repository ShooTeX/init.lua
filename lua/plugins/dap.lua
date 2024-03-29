return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
      node2 = function(config)
        config.configurations = vim.list_extend(require("mason-nvim-dap").default_setup(config).configurations, {
          name = "Debug SST Dev",
          type = "node2",
          request = "launch",
          cwd = vim.fn.getcwd(),
          runtimeExecutable = "${workspaceFolder}/node_modules/.bin/sst",
          runtimeArgs = { "dev", "--increase-timeout" },
          console = "integratedTerminal",
          protocol = "inspector",
          skipFiles = { "<node_internals>/**" },
        })
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  },
}

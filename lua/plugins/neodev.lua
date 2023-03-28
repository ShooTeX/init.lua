return {
  "folke/neodev.nvim",
  opts = {
    override = function(root_dir, library)
      if require("neodev.util").has_file(root_dir, "/nvim") then
        library.enabled = true
        library.plugins = true
      end
    end,
  },
}

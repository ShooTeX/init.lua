return {
  "folke/neodev.nvim",
  enabled = false,
  opts = {
    override = function(root_dir, library)
      if root_dir:match(".dotfiles/nvim") then
        library.enabled = true
        library.plugins = true
      end
    end,
  },
}

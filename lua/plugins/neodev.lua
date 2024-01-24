return {
  "folke/neodev.nvim",
  opts = {
    override = function(root_dir, library)
      if root_dir:find("/.dotfiles/nvim", 1, true) == 1 then
        library.enabled = true
        library.plugins = true
      end
    end,
  },
}

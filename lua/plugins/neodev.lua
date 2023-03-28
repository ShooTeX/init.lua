return {
  "folke/neodev.nvim",
  opts = {
    override = function(root_dir, library)
      if root_dir:find(".dotfiles") then
        library.enabled = true
        library.plugins = true
      end
    end,
  },
}

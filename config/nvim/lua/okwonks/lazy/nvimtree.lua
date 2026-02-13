return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      view = {
        width = 30,
        preserve_window_proportions = true,
      },
      update_focused_file = {
        enable = true,
      },
    })
  end,
}

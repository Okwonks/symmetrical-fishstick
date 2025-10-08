function ColorTheWorld(color)
  color = color or "onedark"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }

      ColorTheWorld()
    end
  }
}

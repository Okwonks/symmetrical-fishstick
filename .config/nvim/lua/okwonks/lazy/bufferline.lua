return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("bufferline").setup({
      options = {
        -- other options...
        offsets = {
          {
            filetype = "NvimTree", -- Specifies the filetype of the window to offset
            text = "File Explorer", -- Text to display in the offset area
            text_align = "left",   -- Alignment of the text
            separator = true,      -- Adds a separator between the offset and the bufferline
            highlight = "Directory", -- Highlight group for the offset area (optional)
          }
        },
      },
    })
  end,
}

return {
  "nvim-telescope/telescope.nvim",

  version = "*",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    require('telescope').setup({
      extentions = {
        fzf = {},
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = 'Telescope find in current buffer' })
    vim.keymap.set('n', '<leader>ep', function()
      builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
      }
    end)

    require 'okwonks.config.telescope.multigrep'.setup()
  end
}

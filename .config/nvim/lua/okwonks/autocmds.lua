local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeStartup", { clear = true }),
  callback = function()
    -- Check if no file arguments were provided
    if vim.fn.argc() == 0 then
      -- Open nvim-tree
      vim.cmd("NvimTreeOpen")
      -- Create a new, empty buffer
    if vim.bo.filetype ~= '' then
      return -- Don't delete if it already has a filetype
    end
    if vim.api.nvim_buf_get_lines(0, 0, -1, false) == '' then
      vim.api.nvim_buf_delete(0, {force = true})
    end
    end
  end,
})

autocmd("UIEnter", {
  callback = function()
    if vim.bo.filetype ~= '' then
      return -- Don't delete if it already has a filetype
    end
    if vim.api.nvim_buf_get_lines(0, 0, -1, false) == '' then
      vim.api.nvim_buf_delete(0, {force = true})
    end
  end,
});

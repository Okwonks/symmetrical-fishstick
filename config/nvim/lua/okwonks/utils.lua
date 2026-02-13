local M = {}

function M.smart_close_buffer()
  local current = vim.api.nvim_get_current_buf()

  -- Skip unlisted or special buffers
  if not vim.api.nvim_buf_get_option(current, "buflisted") then
    vim.notify("Not a listed buffer", vim.log.levels.INFO)
    return
  end

  local filetype = vim.api.nvim_get_option_value("filetype", { buf = current })
  local skip_ft = {
    "NvimTree", "neo-tree", "TelescopePrompt", "aerial",
    "dashboard", "lazy", "mason", "help", "oil"
  }
  if vim.tbl_contains(skip_ft, filetype) then
    vim.notify("Cannot close special buffer: " .. filetype, vim.log.levels.INFO)
    return
  end

  local ok, bufferline = pcall(require, "bufferline")
  local buffers = ok and bufferline.get_elements().elements or {}

  if #buffers == 0 then
    buffers = vim.tbl_filter(function(buf)
      return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted")
    end, vim.api.nvim_list_bufs())
  end

  local index
  for i, buf in ipairs(buffers) do
    local id = buf.id or buf
    if id == current then
      index = i
      break
    end
  end

  local target
  if index then
    local prev = buffers[index - 1]
    local next = buffers[index + 1]
    target = (next and (next.id or next)) or (prev and (prev.id or prev))
  end

  if not target or not vim.api.nvim_buf_is_valid(target) then
    vim.cmd("enew")
    target = vim.api.nvim_get_current_buf()
  end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == current then
      vim.api.nvim_win_set_buf(win, target)
    end
  end

  pcall(vim.cmd, "bdelete " .. current)
end

return M

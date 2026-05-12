local M = {}

function M.close_buffer()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local non_tree_wins = 0
  for _, win in ipairs(wins) do
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative == "" then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype ~= "NvimTree" then
        non_tree_wins = non_tree_wins + 1
      end
    end
  end
  local buf = vim.api.nvim_get_current_buf()
  if non_tree_wins > 1 then
    vim.cmd("close")
  end
  vim.cmd("Bdelete! " .. buf)
end

return M

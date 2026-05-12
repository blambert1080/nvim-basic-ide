-- When nvim is opened with a directory argument, cd into it
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function ()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd.cd(arg)
    end
  end,
})

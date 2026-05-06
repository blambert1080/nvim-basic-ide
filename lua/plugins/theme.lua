return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    --config = function ()
    --  vim.cmd([[colorscheme kanagawa-dragon]])
    --end
  },
  {
    "lunarvim/darkplus.nvim",
    config = function ()
      vim.cmd([[colorscheme darkplus]])
    end
  },
}

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require('kanagawa').setup({
        transparent = true,
      })
      vim.cmd([[colorscheme kanagawa-wave]])
    end
  },
  {
    "lunarvim/darkplus.nvim",
    config = function()
      -- vim.cmd([[colorscheme darkplus]])
    end
  },
}

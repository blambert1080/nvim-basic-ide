return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require('kanagawa').setup({
        transparent = true,
      })
      -- vim.cmd([[colorscheme kanagawa-wave]])
    end
  },
  {
    "lunarvim/darkplus.nvim",
    config = function()
      -- vim.cmd([[colorscheme darkplus]])
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup({
        after_palette = function(palette)
          palette.border_fg = '#434c5e'
          palette.fg_float_border = '#434c5e'
          palette.fg_popup_border = '#434c5e'
        end,
        on_highlight = function(highlights, palette)
          highlights.Visual = {
            bg = palette.blue2,
            fg = palette.black0,
            bold = true,
          }
        end,
        transparent = {
          -- Enable transparent background.
          bg = true,
          -- Enable transparent background for floating windows.
          float = true,
        },
        bright_border = false,
        telescope = {
          style = 'classic'
        }
      })
      require('nordic').load()
      vim.cmd([[colorscheme nordic]])
    end,
  }
}

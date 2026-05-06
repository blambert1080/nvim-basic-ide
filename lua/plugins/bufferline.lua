return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { 'famiu/bufdelete.nvim' },
    opts = {
      options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        custom_filter = function(buf_number)
          -- Get the name of the buffer
          local name = vim.api.nvim_buf_get_name(buf_number)

          -- Hide if the name is empty (i.e., a [No Name] buffer)
          if name == "" then
            return false
          end

          return true
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            text_align = "center",
            highlight = "Directory",
            padding = 1,
          }
        },
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        }

      },

      highlights = {
        fill = {
          fg = "#ff0000",
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        background = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        buffer_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        close_button = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        tab_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },

        tab = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        tab_close = {
          -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
          fg = { attribute = "fg", highlight = "TabLineSel" },
          bg = { attribute = "bg", highlight = "Normal" },
        },

        duplicate_selected = {
          fg = { attribute = "fg", highlight = "TabLineSel" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
          italic = true,
        },

        duplicate_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          italic = true,
        },

        duplicate = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          italic = true,
        },

        modified = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        modified_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },

        modified_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        separator = {
          fg = { attribute = "bg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },

        separator_selected = {
          fg = { attribute = "bg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },

        indicator_selected = {
          fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
      },
    }
  }
}

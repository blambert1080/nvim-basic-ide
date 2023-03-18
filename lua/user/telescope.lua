local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["√"] = actions.move_selection_next,
        ["å"] = actions.move_selection_previous,
        ["<C-a>"] = actions.preview_scrolling_up,
        ["<C-e>"] = actions.preview_scrolling_down,
        ["<C-p>"] = layout.toggle_preview
      },
    },
  },
}

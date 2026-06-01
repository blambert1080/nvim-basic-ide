return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    scratch = {
      -- Options here, or leave empty for defaults
    },
    picker = {},
  },
  keys = {
    { "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  }
}

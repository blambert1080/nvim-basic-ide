local filetypes = {
  { text = "css" },
  { text = "go" },
  { text = "html" },
  { text = "javascript" },
  { text = "javascriptreact" },
  { text = "lua" },
  { text = "markdown" },
  { text = "python" },
  { text = "typescript" },
  { text = "typescriptreact" },
}

return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    explorer = {},
    image = {},
    scratch = {},
    picker = {},
  },
  keys = {
    {
      "<leader>.",
      function()
        require('config.utils').new_scratch(filetypes)
      end,
      desc = "Toggle Scratch Buffer"
    },
    {
      "<leader>S",
      function()
        require('config.utils').select_scratch()
      end,
      desc = "Select Scratch Buffer"
    },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  }
}

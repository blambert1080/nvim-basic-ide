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
    dashboard = {
      preset = {
        header = [[
   .#####-..               .+##########.                     .+######+-..         .+####.....          .+##+... -####-    .#####+                -#+-----..
   -######+.      +####. ..-####+++++++++++++#-      .-+#+--.....--+####+.        -####+.         .#####-.     -##-       -#####+.         .-#######.
   -#########+.   +####-   .####....              ..-#-.              .####.        -####+.     .#####-.       -##-       -#######+..    .-#########
   -#####-######+.+####-   .#########-            .+#-      -#####-    .+#####.         +##+. .#####.          -###-      -####++#####. +#####-#####
   -#####  .-##########-   .####-                                     .####.             ....#####.            -###-      -####+ .+########+. .#####
   -#####       .+#####- ..-####+++++++++++++++##       .++-------++####+.               .-####+.              -###+.     -####+   .+###+.    .#####.
.+######+..        -#+..     +#################.              +##++-.                       .+.              ....+##+-....####-.             .-+##-....
]],
      },
      sections = {
        {
          section = "terminal",
          cmd =
          "chafa ~/.config/nvim/lua/assets/images/guilty_spark.png --format symbols --symbols vhalf --size 60x25 --stretch; sleep .1",
          height = 25,
          padding = 1,
        },
        {
          section = "header",
          padding = 10,
        },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        -- {
        --   pane = 2,
        -- },
      },
    },
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
    { "<leader>e",  function() Snacks.explorer() end,        desc = "File Explorer" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Project..." },
  }
}

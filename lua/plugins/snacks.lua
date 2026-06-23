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
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "p", desc = "Find Project", action = ":lua Snacks.picker.projects()" },
          { icon = " ", key = "t", desc = "Find Text", action = ":lua require('telescope').extensions.live_grep_args.live_grep_args()" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
--         header = [[
-- .#####-..               .+##########.                     .+######+-..         .+####.....          .+##+... -####-    .#####+                -#+-----..
--    -######+.      +####. ..-####+++++++++++++#-      .-+#+--.....--+####+.        -####+.         .#####-.     -##-       -#####+.         .-#######.   
--    -#########+.   +####-   .####....              ..-#-.              .####.        -####+.     .#####-.       -##-       -#######+..    .-#########    
--    -#####-######+.+####-   .#########-            .+#-      -#####-    .+####--         +--.  .#####.          -###-      -####++#####. +#####-#####    
--    -#####  .-##########-   .####-                                     .####.             ____#####.            -###-      -####+ .+########+. .#####    
--    -#####       .+#####- ..-####+++++++++++++++##       .++-------++####+.               .-####+.              -###+.     -####+   .+###+.    .#####.   
-- .+######+..        -#+..     +#################.              +##++-.                       .+.              ....+##+-....####-.             .-+##-.... 
--         ]],
--
        header = [[
.#####-..               .+##########.                     .+######+-..         
   -######+.      +####. ..-####+++++++++++++#-      .-+#+--.....--+####+.     
   -#########+.   +####-   .####....              ..-#-.              .####.   
   -#####-######+.+####-   .#########-            .+#-      -#####-    .+####--
   -#####  .-##########-   .####-                                     .####.   
   -#####       .+#####- ..-####+++++++++++++++##       .++-------++####+.     
.+######+..        -#+..     +#################.              +##++-.          
                                                                               
VIM
        ]],
      },
      sections = {
        {
          section = "terminal",
          cmd =
          "chafa ~/.config/nvim/lua/assets/images/guilty_spark.png --format symbols --symbols vhalf --size 35x16 --stretch --align center; sleep .1",
          height = 16,
          padding = 1,
        },
        {
          section = "header",
          padding = 1,
        },
        { section = "keys",    gap = 1,    padding = 1 },
        { section = "startup", padding = 5 },
      },
    },
    explorer = {},
    image = {},
    scratch = {},
    picker = {
      sources = {
        explorer = {},
      }
    },
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
    { "<leader>e",  function() Snacks.explorer.open() end,   desc = "File Explorer" },
    { "<leader>E",  function() Snacks.explorer.reveal() end,   desc = "Reveal Current File Explorer" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Project..." },
    { "<leader>rf", function() Snacks.dashboard.pick('oldfiles') end, desc = "Recent Files..." },
  }
}

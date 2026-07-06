return {
  "zerochae/dbab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim", -- Optional: for async execution
    -- "tpope/vim-dadbod",      -- Optional: for executor = "dadbod"
  },
  -- For blink.cmp, the source is included in this plugin (blink_dbab)
  config = function()
    require("dbab").setup({
      connections = {
        { name = "ecom", url = "postgres://postgres:postgres@localhost:5432/ecom" },
        -- { name = "prod",  url = "$DATABASE_URL" }, -- supports env vars
      },
    })
  end,
}

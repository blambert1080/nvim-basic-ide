return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
        "tsx",
        "html",
        "hcl"
      },

      highlight = {
        enable = true,
        disable = { "css" },
        use_languagetree = true
      },

      indent = {
        enable = true,
        disable = { "python", "css" }
      }
    }
  }
}

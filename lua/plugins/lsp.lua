return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("basedpyright", { capabilities = capabilities })
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      vim.lsp.enable({
        -- These are the names of the Language server, different than in Mason
        "basedpyright",
        "lua_ls",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "terraformls",
        "ts_ls",
        "yamlls",
      })
    end,
  },
}

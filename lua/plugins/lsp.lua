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
      vim.lsp.config("lua_ls", { root_markers = { 'init.lua' } })
      vim.lsp.config("pyright", {
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', 'pyrightconfig.json' },
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            pythonPath = '.venv/bin/python',
            analysis = {
              typeCheckingMode = 'off',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
      vim.lsp.config("ruff", {
        cmd = { 'ruff', 'server' },
        filetypes = { 'python' },
        root_markers = { 'ruff.toml', '.ruff.toml', 'pyproject.toml' },
        settings = {
          lineLength = 120,
          indent = { indentWidth = 4 },
          format = { quoteStyle = 'single' },
          lint = {
            select = { 'E', 'F', 'UP', 'B', 'SIM', 'I', 'T20' },
            ignore = { 'F401', 'SIM115', 'B017' },
            fixable = { 'ALL' },
          },
          exclude = { '.ruff_cache', '.svn', '.tox', '.venv', 'dist', 'venv' },
        },
      })
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      vim.lsp.config("copilot", { capabilities = capabilities })
      vim.lsp.enable({
        -- These are the names of the Language server, different than in Mason
        "pyright",
        "ruff",
        "lua_ls",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "terraformls",
        "ts_ls",
        "yamlls",
        "copilot",
      })
    end,
  },
}

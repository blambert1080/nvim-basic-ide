local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  return
end

dap_install.setup {}

dap_install.config("python", {})
-- add other configs here

-- setup adapters
require('dap-vscode-js').setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

-- custom adapter for running tasks before starting debug
local custom_adapter = 'pwa-node-custom'
dap.adapters[custom_adapter] = function (cb, config)
  if config.preLaunchTask then
    local async = require('plenary.async')
    local notify = require('notify').async

    async.run(function ()
      notify('Running [' .. config.preLaunchTask .. ']').events.close()
    end, function ()
      vim.fn.system(config.preLaunchTask)
      config.type = 'pwa-node'
      dap.run(config)
    end)
  end
end

-- language config
for _, language in ipairs({ 'typescript', 'javascript', 'typescriptreact' }) do
  dap.configurations[language] = {
    {
      name = 'Debug React Browser',
      type = 'pwa-chrome',
      request = 'launch',
      trace = true,
      rootPath = "${workspaceFolder}",
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**"
      },
      url = 'http://localhost:3000',
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen"
    },
    {
      name = "Attach to node process",
      type = 'pwa-node',
      request = 'attach',
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**"
      },
      rootPath = '${workspaceFolder}',
      processId = require('dap.utils').pick_process,
    },
    {
      name = "Debug React-Scripts Test",
      type = "pwa-node",
      request = "launch",
      runtimeArgs = {
        "./node_modules/react-scripts/bin/react-scripts.js",
        "test",
        "${file}",
        "--watchAll=false",
      },
      trace = true,
      rootPath = "${workspaceFolder}",
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**"
      },
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

dapui.setup {
  expand_lines = true,
  icons = { expanded = "", collapsed = "", circular = "" },
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

local function after_session()
  dapui.close()
  -- dap.repl.close()
end

local function open_dapui()
  dapui.open()
end

dap.listeners.after.event_initialized["dapui_config"] = open_dapui

dap.listeners.after.event_breakpoint["dapui_config"] = open_dapui

dap.listeners.before.event_terminated["dapui_config"] = after_session

dap.listeners.before.event_exited["dapui_config"] = after_session


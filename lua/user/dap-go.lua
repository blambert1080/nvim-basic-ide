local dap_go_ok, dapgo = pcall(require, "dap-go")
if not dap_go_ok then
  return
end

dapgo.setup()


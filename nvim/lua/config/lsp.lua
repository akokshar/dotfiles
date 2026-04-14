vim.lsp.enable({
  --"bashls",
  "docker_ls",
  "gopls",
  "lua_ls",
  --"ts_ls",
  "helm_ls",
  "yaml_ls",
  --"pyright",
  "terraform-ls",
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
  virtual_lines = false,
  virtual_text = false,
})

local completion = vim.g.completion_mode or "blink"

local keymaps = {
  { keys = "<leader>vd", func = vim.diagnostic.open_float, desc = "Show diagnostic" },
  { keys = "<leader>ca", func = vim.lsp.buf.code_action,   desc = "Code actions" },
  { keys = "<leader>cf", func = vim.lsp.buf.format,        desc = "Code format" },
}

vim.api.nvim_create_augroup("LspAttachGroup", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttachGroup",
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      if completion == "native" and client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      end
    end

    for _, km in ipairs(keymaps) do
      --if not km.has or client.server_capabilities[km.has] then
      vim.keymap.set(
        km.mode or "n",
        km.keys,
        km.func,
        { buffer = buf, desc = "LSP: " .. km.desc, nowait = km.nowait }
      )
      --end
    end
  end,
})

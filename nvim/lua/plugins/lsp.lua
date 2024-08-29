return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  --{
  --	"ray-x/lsp_signature.nvim",
  --	event = "VeryLazy",
  --	config = function()
  --		require("lsp_signature").setup({
  --			bind = true, -- This is mandatory, otherwise border config won't get registered.
  --			handler_opts = {
  --				border = "rounded",
  --			},
  --			close_timeout = 100,
  --			hint_enable = true,
  --			floating_window = false,
  --			hint_inline = function()
  --				return "right_align"
  --			end,
  --		})
  --	end,
  --},
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.terraform_validate,
          --null_ls.builtins.formatting.prettier,
          --null_ls.builtins.diagnostics.erb_lint,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )
      --capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local function buf_set_option(...)
        	vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        --vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        --vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wl', function()
        --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        --vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<CR>", { desc = "Diagnostics in telescope" })
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
      end

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          usePlaceholders = true,
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          experimentalFeatures = {
            validateOnSave = false,
            prefillRequiredFields = true,
          },
          validation = {
            enableEnhancedValidation = true,
          },
        },
      })

    end,
  },
}

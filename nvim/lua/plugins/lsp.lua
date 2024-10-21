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
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
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

        --vim.api.nvim_create_autocmd("CursorHold", {
        --  buffer = bufnr,
        --  callback = function()
        --    local opts = {
        --      focusable = false,
        --      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        --      border = "rounded",
        --      source = "always",
        --      prefix = " ",
        --      scope = "cursor",
        --    }
        --    vim.diagnostic.open_float(nil, opts)
        --  end,
        --})

        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set(
          "n",
          "<leader>ca",
          vim.lsp.buf.code_action,
          vim.tbl_extend("keep", { desc = "Code action" }, opts)
        )
        vim.keymap.set(
          "n",
          "<leader>cf",
          vim.lsp.buf.format,
          vim.tbl_extend("keep", { desc = "Format code" }, opts)
        )
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("keep", { desc = "Rename" }, opts))

        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("keep", { desc = "Hover" }, opts))
        vim.keymap.set(
          "i",
          "<C-k>",
          vim.lsp.buf.signature_help,
          vim.tbl_extend("keep", { desc = "Signature help" }, opts)
        )

        vim.keymap.set(
          "n",
          "gD",
          vim.lsp.buf.declaration,
          vim.tbl_extend("keep", { desc = "Go to declaration" }, opts)
        )
        vim.keymap.set(
          "n",
          "gd",
          vim.lsp.buf.definition,
          vim.tbl_extend("keep", { desc = "Go to definition" }, opts)
        )
        vim.keymap.set(
          "n",
          "gi",
          vim.lsp.buf.implementation,
          vim.tbl_extend("keep", { desc = "Go to implementation" }, opts)
        )
        --vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        --vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wl', function()
        --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, opts)
        vim.keymap.set(
          "n",
          "gt",
          vim.lsp.buf.type_definition,
          vim.tbl_extend("keep", { desc = "Type definition" }, opts)
        )
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("keep", { desc = "References" }, opts))

        --vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<CR>", { desc = "Diagnostics in telescope" })
        vim.keymap.set(
          "n",
          "<leader>e",
          vim.diagnostic.open_float,
          vim.tbl_extend("keep", { desc = "Diagnostic" }, opts)
        )
        vim.keymap.set(
          "n",
          "[d",
          vim.diagnostic.goto_prev,
          vim.tbl_extend("keep", { desc = "Diagnostic prev" }, opts)
        )
        vim.keymap.set(
          "n",
          "]d",
          vim.diagnostic.goto_next,
          vim.tbl_extend("keep", { desc = "Diagnostic next" }, opts)
        )
        vim.keymap.set(
          "n",
          "<leader>q",
          vim.diagnostic.setloclist,
          vim.tbl_extend("keep", { desc = "Diagnostic locations list" }, opts)
        )
      end

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          usePlaceholders = true,
        },
        --root_dir = lspconfig.util.root_pattern("go.mod", ".git", vim.fn.getcwd()),
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

      lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {},
        root_dir = lspconfig.util.root_pattern(".git", "go.mod", vim.fn.getcwd()),
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {},
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            format = {
              enable = true,
              bracketSpacing = true,
            },
            hover = true,
            editor = { tabSize = 2 },
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
              ".gitlab-ci.yml",
              ["kubernetes"] = "*/manifests/**/*.yaml",
            },
          },
        },
        --root_dir = lspconfig.util.root_pattern(".git", "go.mod", vim.fn.getcwd()),
      })
    end,
  },
}

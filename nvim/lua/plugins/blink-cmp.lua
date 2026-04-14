vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})

require("blink.cmp").setup({
  --keymap = { preset = "super-tab" },
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},
	keymap = {
    preset = "enter",
		--preset = "default",
		--["<C-Space>"] = { "show" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<CR>"] = { 'accept', 'fallback' },
    ['<ESC>'] = { 'cancel', 'fallback' },
	},
	completion = {
    list = {
      selection = {
        preselect = true,
      }
    },
		menu = {
      border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+
			draw = {
        align_to = 'label', -- or 'none' to disable, or 'cursor' to align to the cursor
				treesitter = { "lsp" },
        columns = {
          { "label", "label_description", gap = 3 },
          { "kind_icon" },
          { "source_id" }
        }
			},
		},
		ghost_text = {
			enabled = true,
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 300,
      treesitter_highlighting = true,
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "lua",
	},
})

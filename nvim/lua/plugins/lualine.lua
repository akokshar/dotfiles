vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
	options = {
		theme = "gruvbox",
		globalstatus = true,
		disabled_filetypes = {
			statusline = {
				"NvimTree",
				"neo-tree",
        "fyler",
        --"snacks_picker_list",
        --"snacks_picker_input",
				"dap-repl",
				"dapui_console",
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_stacks",
				"dapui_watches",
				"toggleterm",
			}, -- only ignores the ft for statusline.
			winbar = {
				"NvimTree",
				"neo-tree",
        "fyler",
        "snacks_picker_list",
        "snacks_picker_input",
				"dap-repl",
				--"dapui_console",
				--"dapui_scopes",
				--"dapui_breakpoints",
				--"dapui_stacks",
				--"dapui_watches",
				"toggleterm",
			}, -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {}, --{ "lsp_signature" },
		lualine_x = {
--      {
--        require("noice").api.status.message.get_hl,
--        cond = require("noice").api.status.message.has,
--      },
--      {
--        require("noice").api.status.command.get,
--        cond = require("noice").api.status.command.has,
--        color = { fg = "#ff9e64" },
--      },
--      {
--        require("noice").api.status.mode.get,
--        cond = require("noice").api.status.mode.has,
--        color = { fg = "#ff9e64" },
--      },
--      {
--        require("noice").api.status.search.get,
--        cond = require("noice").api.status.search.has,
--        color = { fg = "#ff9e64" },
--      },
    },
		lualine_y = {},
		lualine_z = { "filetype", "location" },
	},
	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = { modified = "~" },
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = { modified = "~" },
			},
		},
	},
})

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ray-x/lsp_signature.nvim",
	},
	config = function()
		vim.cmd("set noshowmode")
		--local current_signature = function(width)
		--	if not pcall(require, "lsp_signature") then
		--		return
		--	end
		--	local sig = require("lsp_signature").status_line(width)
		--	return sig.label .. " " .. sig.hint
		--end

		require("lualine").setup({
			options = {
				theme = "gruvbox",
				--globalstatus = true,
				disabled_filetypes = { -- Filetypes to disable lualine for.
					statusline = {
						"NvimTree",
						"neo-tree",
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
				lualine_x = {},
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
					},
				},
			},
		})
	end,
}

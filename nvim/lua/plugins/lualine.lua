return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ray-x/lsp_signature.nvim",
	},
	config = function()
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
					statusline = { "neo-tree" }, -- only ignores the ft for statusline.
					winbar = {}, -- only ignores the ft for winbar.
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
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

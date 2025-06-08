return {
	{
		"morhetz/gruvbox",
		lazy = false,
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
			vim.cmd("highlight MsgArea cterm=bold ctermfg=red")

			vim.cmd([[highlight ExtraSpaces ctermbg=DarkRed]])
			vim.cmd([[match ExtraSpaces /\v\s+$/]])

			--vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#00FFFF", bold = true }) -- cyan bold
			--vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#00FFFF", bold = true }) -- cyan bold
			--vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#00FFFF", bold = true }) -- cyan bold
		end,
	},
}

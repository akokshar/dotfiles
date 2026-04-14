vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
}, { load = true })

require("nvim-treesitter").setup({})

require("nvim-treesitter")
	.install({
		"dockerfile",
		"hcl",
		"lua",
		"terraform",
		"yaml",
    "helm",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
		--	"go",
		--	"javascript",
		--	"make",
	})
	:wait(300000)

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = false,
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
		include_surrounding_whitespace = false,
	},
	move = {
		enable = true,
		set_jumps = true,
	},
})

vim.api.nvim_create_augroup("TreeSitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"terraform",
    "hcl",
    "helm",
    "yaml",
	},
	group = "TreeSitter",
	callback = function()
    --local bufnr = vim.api.nvim_get_current_buf()

		-- syntax highlighting, provided by Neovim
    --pcall(vim.treesitter.start, bufnr)
		vim.treesitter.start()
		-- folds, provided by Neovim
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})


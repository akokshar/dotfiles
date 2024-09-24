return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"go",
					"hcl",
					"terraform",
					"lua",
					"vim",
					"javascript",
					"html",
					"yaml",
				},
				auto_install = true,
				ignore_install = { "dockerfile" },
				highlight = {
					enable = true,
					disable = { "dockerfile" },
				},
				indent = { enable = true },
			})
		end,
	},
}

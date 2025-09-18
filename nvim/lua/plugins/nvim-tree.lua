return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			hijack_cursor = true,
			disable_netrw = true,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = true,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 40,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			renderer = {
				group_empty = true,
				icons = {
					diagnostics_placement = "signcolumn",
					git_placement = "after",
					modified_placement = "signcolumn",
					glyphs = {
						modified = "~",
						git = {
							unstaged = "~",
							staged = "+",
							unmerged = "",
							renamed = "➜",
							untracked = "?",
							deleted = "✗",
							ignored = " ",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
			},
			modified = {
				enable = true,
			},
			filters = {
				dotfiles = false,
			},
		})

		vim.api.nvim_create_augroup("NvimTreeSettings", { clear = true })
		-- Work aroud number collumn suddenly appering when
		-- in INSERT mode in a window
		-- click to NvimTree window
		-- press ESC key
		vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
			group = "NvimTreeSettings",
			pattern = "NvimTree_*",
			callback = function()
				vim.wo.relativenumber = false
				vim.wo.number = false
			end,
		})
	end,
	keys = {
		{
			"<leader>e",
			function()
				require("nvim-tree.api").tree.open()
			end,
			mode = "n",
			desc = "Focus NvimTree",
		},
	},
}

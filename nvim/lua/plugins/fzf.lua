vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
}, {
	load = true,
})

--vim.cmd("packadd fzf-lua")

require("fzf-lua").setup({
	winopts = {
		fullscreen = true,
		preview = {
			title = true,
		},
	},
})

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Files" } )
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_project<CR>", { desc = "Grep project files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" } )
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>")

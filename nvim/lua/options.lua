vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = "\\"

vim.cmd("set mouse=nvir")
vim.cmd("set noshowcmd")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set t_Co=256")

vim.cmd("set lcs+=space:·,tab:\\ —→,trail:×")
--vim.cmd("set list")

vim.keymap.set({"n", "i"}, "<c-s>", "<cmd>:w<CR><ESC>", { silent = true })

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>")

vim.wo.signcolumn = "yes"

vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_create_augroup("RelativeNumber", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = "RelativeNumber",
	pattern = "*",
	command = "set norelativenumber",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = "RelativeNumber",
	pattern = "*",
	command = "set relativenumber",
})

-- LSP UI

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Or "if_many"
	},
	float = {
		source = "always", -- Or "if_many"
	},
	--virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

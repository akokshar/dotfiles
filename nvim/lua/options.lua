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

vim.keymap.set({ "n", "i" }, "<c-s>", "<cmd>:w<CR><ESC>", { silent = true })

-- Navigate/Resize vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<M-k>", ":resize +1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", ":resize -1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-h>", ":vertical resize +1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", ":vertical resize -1<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>")

vim.wo.signcolumn = "yes"

vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_create_augroup("RelativeNumber", { clear = true })
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
-- 	group = "RelativeNumber",
-- 	pattern = "*",
-- 	callback = function()
-- 		if vim.fn.mode() == "i" then
-- 			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
-- 		end
-- 	end,
-- })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = "RelativeNumber",
	pattern = "*",
	callback = function()
		-- if vim.bo.filetype == "NvimTree" then
		--   return
		-- end
		vim.wo.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = "RelativeNumber",
	pattern = "*",
	callback = function()
		-- if vim.bo.filetype == "NvimTree" then
		--   return
		-- end
		vim.wo.relativenumber = true
	end,
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

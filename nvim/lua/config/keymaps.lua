local map = vim.keymap.set

-- Buffers
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
--map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

-- Go to different windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize windows/buffers with Ctrl+Cmd+arrow keys (macOS)
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", { noremap = true, silent = true })

-- Clear search
--map("n", "<leader>/", ":nohlsearch<CR>")
map({ "i", "n" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Save buffer
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>zz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', { noremap = true, silent = true })


-- location list
map("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- vim.pack keymaps
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update plugins" })
map("n", "<leader>pd", function()
	vim.ui.input({ prompt = "Plugin name to delete: " }, function(input)
		if input and input ~= "" then
			pcall(vim.pack.del, { input })
		end
	end)
end, { desc = "Delete plugin" })


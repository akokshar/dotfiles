return {
	"nvim-neo-tree/neo-tree.nvim",
	--branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local function getTelescopeOpts(state, path)
			return {
				cwd = path,
				search_dirs = { path },
				--attach_mappings = function(prompt_bufnr, map)
				attach_mappings = function(prompt_bufnr, _)
					local actions = require("telescope.actions")
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local action_state = require("telescope.actions.state")
						local selection = action_state.get_selected_entry()
						local filename = selection.filename
						if filename == nil then
							filename = selection[1]
						end
						-- any way to open the file without triggering auto-close event of neo-tree?
						require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
					end)
					return true
				end,
			}
		end

		require("neo-tree").setup({
			close_if_last_window = true,
			--popup_border_style = "rounded",
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			window = {
				mappings = {
					["E"] = function()
						vim.api.nvim_exec("Neotree focus filesystem left", true)
					end,
					["B"] = function()
						vim.api.nvim_exec("Neotree focus buffers left", true)
					end,
					["G"] = function()
						vim.api.nvim_exec("Neotree focus git_status left", true)
					end,
				},
			},
			filesystem = {
				window = {
					mappings = {
						["tf"] = "telescope_find",
						["tg"] = "telescope_grep",
					},
				},
			},
			commands = {
				telescope_find = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					require("telescope.builtin").find_files(getTelescopeOpts(state, path))
				end,
				telescope_grep = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
				end,
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						vim.cmd("Neotree close")
					end,
				},
				--{
				--	event = "neo_tree_buffer_enter",
				--	handler = function()
				--		vim.o.showmode = false
				--		vim.o.ruler = false
				--		vim.o.laststatus = 0
				--		vim.o.showcmd = false
				--	end,
				--},
				--{
				--	event = "neo_tree_buffer_leave",
				--	handler = function()
				--		vim.o.showmode = true
				--		vim.o.ruler = true
				--		vim.o.laststatus = 2
				--		vim.o.showcmd = true
				--	end,
				--},
			},
		})

		vim.keymap.set("n", "<M-E>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<M-B>", ":Neotree buffers reveal left<CR>", {})
		vim.keymap.set("n", "<M-G>", ":Neotree git_status reveal left<CR>", {})
	end,
}

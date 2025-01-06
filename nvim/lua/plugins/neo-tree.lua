return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    --local function getTelescopeOpts(state, path)
    --	return {
    --		cwd = path,
    --		search_dirs = { path },
    --		--attach_mappings = function(prompt_bufnr, map)
    --		attach_mappings = function(prompt_bufnr, _)
    --			local actions = require("telescope.actions")
    --			actions.select_default:replace(function()
    --				actions.close(prompt_bufnr)
    --				local action_state = require("telescope.actions.state")
    --				local selection = action_state.get_selected_entry()
    --				local filename = selection.filename
    --				if filename == nil then
    --					filename = selection[1]
    --				end
    --				-- any way to open the file without triggering auto-close event of neo-tree?
    --				require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
    --			end)
    --			return true
    --		end,
    --	}
    --end

    local events = require("neo-tree.events")
    require("neo-tree").setup({
      enable_git_status = false,
      close_if_last_window = true,
      --popup_border_style = "rounded",
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

      source_selector = {
        winbar = true, -- toggle to show selector on winbar
        statusline = false, -- toggle to show selector on statusline
        show_scrolled_off_parent_node = true, -- boolean
        sources = { -- table
          {
            source = "filesystem", -- string
            display_name = " 󰉓 Files ", -- string | nil
          },
          {
            source = "buffers", -- string
            display_name = " 󰈚 Buffers ", -- string | nil
          },
          --{
          --	source = "git_status", -- string
          --	display_name = " 󰊢 Git ", -- string | nil
          --},
        },
        content_layout = "center", -- string
        tabs_layout = "start", -- string
        truncation_character = "…", -- string
        tabs_min_width = nil, -- int | nil
        tabs_max_width = nil, -- int | nil
        padding = 1, -- int | { left: int, right: int }
        separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
        separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
        show_separator_on_edge = false, -- boolean
        highlight_tab = "NeoTreeTabInactive", -- string
        highlight_tab_active = "NeoTreeTabActive", -- string
        highlight_background = "NeoTreeTabInactive", -- string
        highlight_separator = "NeoTreeTabSeparatorInactive", -- string
        highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
      },

      window = {
        width = "32",
        mappings = {
          ["E"] = function()
            vim.api.nvim_exec("Neotree focus filesystem left", true)
          end,
          ["B"] = function()
            vim.api.nvim_exec("Neotree focus buffers left", true)
          end,
          --["G"] = function()
          --	vim.api.nvim_exec("Neotree focus git_status left", true)
          --end,
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
            ".dockerignore",
            ".gitlab-ci.yml",
          },
        },
        --	window = {
        --		mappings = {
        --			["tf"] = "telescope_find",
        --			["tg"] = "telescope_grep",
        --		},
        --	},
        --},
        --commands = {
        --	telescope_find = function(state)
        --		local node = state.tree:get_node()
        --		local path = node:get_id()
        --		require("telescope.builtin").find_files(getTelescopeOpts(state, path))
        --	end,
        --	telescope_grep = function(state)
        --		local node = state.tree:get_node()
        --		local path = node:get_id()
        --		require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
        --	end,
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            --vim.cmd("Neotree close")
          end,
        },
        {
          event = events.NEO_TREE_BUFFER_ENTER,
          handler = function()
            vim.cmd("setlocal nonumber")
            --vim.o.showmode = false
            --vim.o.ruler = false
            --vim.o.laststatus = 0
            --vim.o.showcmd = false
            vim.cmd("setlocal signcolumn=no")
            vim.cmd("stopinsert")
          end,
        },
        --event_handlers = {
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
    --vim.keymap.set("n", "<M-G>", ":Neotree git_status reveal left<CR>", {})
  end,
}

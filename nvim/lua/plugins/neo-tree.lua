vim.pack.add({
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3"),
    cmd = "Neotree",
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
}, {
  load = true
})

require("neo-tree").setup({
  enable_git_status = false,
  close_if_last_window = true,
  popup_border_style = "rounded",
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

  default_component_configs = {
    modified = {
      symbol = "~ ",
      highlight = "NeoTreeModified",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "",
        renamed   = "󰁕",
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      }
    },
  },

  window = {
    width = "32",
    mappings = {
      ["E"] = function()
        vim.cmd("Neotree focus filesystem left", true)
      end,
      ["B"] = function()
        vim.cmd("Neotree focus buffers left", true)
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
  },
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        --vim.cmd("Neotree close")
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

vim.keymap.set({ "n" }, "<leader>ef",
  function()
    vim.cmd("Neotree filesystem show left")
    vim.cmd("Neotree filesystem focus")
  end,
  { desc = "Files explorer" }
)

vim.keymap.set({ "n" }, "<leader>eb",
  function()
    vim.cmd("Neotree buffers show left")
    vim.cmd("Neotree buffers focus")
  end,
  { desc = "Buffers explorer" }
)

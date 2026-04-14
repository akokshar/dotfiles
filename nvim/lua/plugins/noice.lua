vim.pack.add({
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
})

require(".noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },

  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = false,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },

  views = {
    popupmenu = {
      border = { style = "rounded" },
      padding = { 1, 2 },
    },
    cmdline_input = {
      view = "cmdline_popup",
      border = {
        style = "rounded",
        padding = { 1, 2 },
      },
    },
  },

  cmdline = {
    enabled = true,                       -- enables the Noice cmdline UI
    view = "cmdline",                     -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {
      buf_options = { filetype = "vim" }, -- Syntax highlighting in cmdline
    },
    format = {
      search_down = {
        view = "cmdline",
      },
      search_up = {
        view = "cmdline",
      },
    },
  },

  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
  },

  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true,            -- enables the Noice messages UI
    view = "notify",           -- default view for messages
    view_error = "notify",     -- view for errors
    view_warn = "notify",      -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = false        -- "virtualtext", -- view for search count messages. Set to `false` to disable
  },

  popupmenu = {
    enabled = true,
    backend = "cmp",
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = "了 ",
      EnumMember = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Keyword = " ",
      Method = "ƒ ",
      Module = " ",
      Property = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
  },
})

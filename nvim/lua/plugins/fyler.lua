vim.pack.add({
  "https://github.com/A7Lavinraj/fyler.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
}, {
  load = true,
})

require("fyler").setup({
  integrations = {
    icon = "nvim_web_devicons",
  },
  views = {
    finder = {
      close_on_select = false,
      confirm_simple = true,
      default_explorer = true,
      delete_to_trash = true,
      follow_current_file = true,
      -- icon = {
      --   directory_collapsed = icons.kind.Folder,
      --   directory_expanded = icons.ui.FolderExpanded,
      --   directory_empty = icons.ui.FolderEmpty,
      -- },
      columns_order = { "link", "permission", "size", "git", "diagnostic" },
      columns = {
        git = {
          enabled = false,
        },
        diagnostic = {
          enabled = true,
          symbols = {
            Error = "",
            Warn = "",
            Info = "",
            Hint = "",
          },
        },
        link = {
          enabled = true,
        },
        permission = {
          enabled = false,
        },
        size = {
          enabled = false,
        },
      },
      indentscope = {
        enabled = true,
      },
      watcher = {
        enabled = true,
      },
      win = {
        border = "rounded",
        kind = "split_left_most",
        kind_presets = {
          float = {
            height = "80%",
            width = "80%",
            top = "7.5%",
            left = "7.5%",
          },
          split_left_most = {
            width = "20%",
            win_opts = {
              winfixwidth = false,
            },
          },
        },
        win_opts = {
          concealcursor = "nvic",
          conceallevel = 3,
          cursorline = true,
          number = false,
          relativenumber = false,
          signcolumn = "no",
          winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
          wrap = false,
        },
      },
    },
  },
})

vim.keymap.set({ "n" }, "<leader>ef",
  "<cmd>Fyler<cr>",
  { desc = "Files explorer" }
)

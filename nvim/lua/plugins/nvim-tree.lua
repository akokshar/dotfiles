vim.pack.add({
  {
    src = "https://github.com/nvim-tree/nvim-tree.lua",
  },
  "https://github.com/nvim-tree/nvim-web-devicons",
}, {
  load = true
})

require("nvim-tree").setup({
  log = {
    enable = false,
  },
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
    width = 35,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        },
      },
      git_placement = "before",
      modified_placement = "after",
      hidden_placement = "after",
      diagnostics_placement = "signcolumn",
      bookmarks_placement = "signcolumn",
      glyphs = {
        modified = "~",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
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

--vim.api.nvim_create_augroup("NvimTreeSettings", { clear = true })
---- Work aroud number collumn suddenly appering when
---- in INSERT mode in a window
---- click to NvimTree window
---- press ESC key
--vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter" }, {
--  group = "NvimTreeSettings",
--  pattern = "NvimTree_*",
--  callback = function()
--    vim.wo.relativenumber = false
--    vim.wo.number = false
--  end,
--})

vim.keymap.set({ "n" }, "<leader>ef",
  function()
    require("nvim-tree.api").tree.open()
  end,
  { desc = "Files explorer" }
)

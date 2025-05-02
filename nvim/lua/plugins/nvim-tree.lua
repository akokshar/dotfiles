return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
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
        width = 32,
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
  keys = {
    {
      "<M-E>",
      function() require("nvim-tree.api").tree.focus() end,
      mode = "n",
      desc = "Focus NvimTree",
    },
  },
}

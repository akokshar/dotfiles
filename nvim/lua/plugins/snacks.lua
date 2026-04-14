vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

local snacks = require("snacks")

snacks.setup({
  -- FILE EXPLORER: Integrated Sidebar Explorer
  explorer = {
    replace_netrw = true,   -- Fully replaces the old :Ex
  },
  -- PROJECT MANAGER: Picker settings for finding projects
  picker = {
    sources = {
      projects = {
        confirm = "load_session",                                   -- Automatically loads session when switching
        patterns = { ".git", "lua", "Makefile", "package.json" },   -- Root markers
      },
    },
  },
  -- Extra UI Polish
  indent = { enabled = true },     -- Better indent guides
  input = { enabled = true },      -- Prettier vim.ui.input prompts
  notifier = { enabled = true },   -- Modern notification system
})

vim.keymap.set({ "n" }, "<leader>ee",
  function()
    snacks.explorer()
  end,
  { desc = "Files picker" }
)

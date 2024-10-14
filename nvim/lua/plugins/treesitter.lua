-- https://www.josean.com/posts/nvim-treesitter-and-textobjects

return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = {
          "go",
          "hcl",
          "terraform",
          "lua",
          "vim",
          "javascript",
          "dockerfile",
          "html",
          "yaml",
        },
        --ignore_install = { "dockerfile" },
        auto_install = true,
        highlight = {
          enable = true,
          --disable = { "dockerfile" },
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v",
            node_incremental = "<leader>v",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}

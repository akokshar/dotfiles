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
            keymaps = {
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
              ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
              ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

              ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

              ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
              ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

              ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
              ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

              ["am"] = {
                query = "@function.outer",
                desc = "Select outer part of a method/function definition",
              },
              ["im"] = {
                query = "@function.inner",
                desc = "Select inner part of a method/function definition",
              },

              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
            },
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
          "dockerfile",
          "go",
          "hcl",
          "html",
          "javascript",
          "lua",
          "make",
          "terraform",
          "vim",
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

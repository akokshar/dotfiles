return {
  -- spectre for search & replace
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>S",
      function()
        require("spectre").toggle()
      end,
      desc = "Toggle Spectre",
    },
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Search & Replace (spectre)",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search({select_word=true})
      end,
      desc = "Search on current file",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      mode = "n",
      desc = "Search word under cursor",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual()
      end,
      mode = "v",
      desc = "Search word under cursor",
    },
  },
  config = function()
    require("spectre").setup()
  end,
}

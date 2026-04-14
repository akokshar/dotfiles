vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim"},
})

local wk = require("which-key")
wk.setup({
  preset = "helix",

--  keys = {
--    {
--      "<leader>?",
--      function()
--        require("which-key").show({ global = false })
--      end,
--      desc = "Buffer Local Keymaps (which-key)",
--    },
--  },
})

--wk.add({})

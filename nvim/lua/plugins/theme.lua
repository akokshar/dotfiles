return {
  {
    "morhetz/gruvbox",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
      vim.cmd("highlight MsgArea cterm=bold ctermfg=124")
    end,
  },
}

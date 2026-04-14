vim.pack.add({
	--"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/morhetz/gruvbox",
}, {
	load = true,
})

vim.cmd("colorscheme gruvbox")

--require("gruvbox").setup({})
--require("gruvbox").setup({
--  terminal_colors = true, -- add neovim terminal colors
--  undercurl = true,
--  underline = true,
--  bold = true,
--  italic = {
--    strings = true,
--    emphasis = true,
--    comments = true,
--    operators = false,
--    folds = true,
--  },
--  strikethrough = true,
--  invert_selection = false,
--  invert_signs = false,
--  invert_tabline = false,
--  inverse = true, -- invert background for search, diffs, statuslines and errors
--  contrast = "soft", -- can be "hard", "soft" or empty string
--  palette_overrides = {},
--  overrides = {},
--  dim_inactive = true,
--  transparent_mode = false,
--})

return {
	"akinsho/toggleterm.nvim",
	name = "toggleterm",
	priority = 1000,
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 25
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,

			open_mapping = [[<c-\>]],
			hide_numbers = true,
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})
	end,
}

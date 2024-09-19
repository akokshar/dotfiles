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
			float_opts = {
        border = "none",
				width = function(_)
					return vim.o.columns
				end,
				height = function(_)
					return vim.o.lines - 1
				end,
			},
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      name = "lazygit",
      hidden = true
    })

		function LazygitToggle()
			lazygit:toggle()
		end
	end,
}

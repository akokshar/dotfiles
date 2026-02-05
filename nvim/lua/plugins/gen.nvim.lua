return {
	"David-Kunz/gen.nvim",
	config = function()
		local gen = require("gen")
		gen.setup({
			model = "codellama:13b-instruct",
			model_options = {
				max_tokens = 8192,
				temperature = 0.2,
				top_p = 0.95, -- 0 = off
				top_k = 0,
			},
			display_mode = "vertical-split",
			retry_map = "<c-r>", -- set keymap to re-send the current prompt
			accept_map = "<leader>gA", -- set keymap to replace the previous selection with the last result
			show_prompt = false,
			show_model = false,
			--no_auto_close = false,
			init = function()
				-- pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
		})

		gen.prompts["Fix_Code"] = {
			prompt = "You are a VERY helpful code assistante. Review $filetype code, fix bugs, improve clarity, and preserve behavior. Return and explain ONLY changes you would make. Code: $text",
			replace = false,
		}

		vim.keymap.set(
			{ "v" },
			"<leader>ga",
			":<C-u>Gen Ask<CR>",
			{ desc = "Gen: Ask about selection", noremap = true, silent = true }
		)
		vim.keymap.set(
			{ "v", "n" },
			"<leader>gf",
			":Gen Fix_Code<CR>",
			{ desc = "Gen: Fix code", noremap = true, silent = true }
		)
	end,
}

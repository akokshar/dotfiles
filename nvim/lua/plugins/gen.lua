return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "qwen2.5-coder:14b-instruct-q4_K_M",
      model_options = {
        max_tokens = 1000,
        temperature = 0.1,
      },
			display_mode = "vertical-split",
			show_prompt = false,
			show_model = true,
			--no_auto_close = false,
			init = function()
				-- pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
		})
	end,
}

return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

      require("dap-go").setup()
      require("dapui").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<F5>", dap.continue, {})
			vim.keymap.set("n", "<F6>", dap.terminate, {})
			vim.keymap.set("n", "<F7>", dap.step_out, {})
			vim.keymap.set("n", "<F8>", dap.step_into, {})
			vim.keymap.set("n", "<F9>", dap.step_over, {})
			vim.keymap.set("n", "<F4>", dap.toggle_breakpoint, {})
		end,
	},
}

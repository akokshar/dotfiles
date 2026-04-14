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
      local dap_go = require("dap-go")

      dap_go.setup()
      --require("dap-go").setup()
      dapui.setup()
      --require("dapui").setup()

      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
          -- add this if on windows, otherwise server won't open successfully
          -- detached = false
        },
        tests = {
          -- enables verbosity when running the test.
          verbose = true,
        },
      }

      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${fileDirname}",
          --buildFlags = "--test.v",
        },
      }

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

      vim.keymap.set("n", "<F4>", dap.toggle_breakpoint, { desc = "Toggle breakpoing" })
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<F6>", dap_go.debug_test, { desc = "Debug test" })
      vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Step out" })
      vim.keymap.set("n", "<F8>", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<F10>", dap.terminate, { desc = "Terminate" })
    end,
  },
}

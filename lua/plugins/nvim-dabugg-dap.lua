
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    {
      "nvim-neotest/nvim-nio",
      lazy = true,
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup DAP UI
    dapui.setup()
    require("nvim-dap-virtual-text").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "js-debug-adapter" },
      automatic_setup = true,
    })

    -- Auto open/close dap-ui
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- ✅ FIXED: JS/TS (Node.js) Adapter Path using Mason
    local debugger_path = vim.fn.stdpath("data")
      .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = 8123,
      executable = {
        command = "node",
        args = { debugger_path, "--port", "8123" },
      },
    }

    -- Debug configuration for JavaScript & TypeScript
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.typescript = dap.configurations.javascript

    -- Keymaps with Ctrl + Number
    vim.keymap.set("n", "<C-1>", function() dap.continue() end, { desc = "DAP: Start/Continue" })
    vim.keymap.set("n", "<C-2>", function() dap.step_over() end, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<C-3>", function() dap.step_into() end, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<C-4>", function() dap.step_out() end, { desc = "DAP: Step Out" })
    vim.keymap.set("n", "<C-5>", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
    vim.keymap.set("n", "<C-6>", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP: Conditional Breakpoint" })
    vim.keymap.set("n", "<C-7>", function() dap.repl.open() end, { desc = "DAP: Open REPL" })
    vim.keymap.set("n", "<C-8>", function() dapui.toggle() end, { desc = "DAP: Toggle UI" })
  end,
}

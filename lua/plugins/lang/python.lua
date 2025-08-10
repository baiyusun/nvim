-- vim.lsp.enable("basedpyright")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = { "ninja", "rst", "python" },
    },
    opts_extend = { "ensure_installed" },
  },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "basedpyright",
        "pyright",
        "black",
        "isort",
      },
    },
    opts_extend = { "ensure_installed" },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
      },
    },
    opts_extend = { "ensure_installed" },
  },
  -- Python 调试支持
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      vim.keymap.set("n", "<leader>dpr", function()
        require("dap-python").test_method()
      end, { desc = "调试 Python 方法" })
    end,
  },

  -- 通用调试适配器
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      { "nvim-neotest/nvim-nio" },
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- 调试快捷键
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "开始/继续调试" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "单步跳过" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "单步进入" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "单步退出" })
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "切换断点" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("断点条件: "))
      end, { desc = "条件断点" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "打开调试 REPL" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "运行上次调试" })

      -- 自动打开/关闭 DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- 代码补全
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
}

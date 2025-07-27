vim.lsp.enable("basedpyright")

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
}

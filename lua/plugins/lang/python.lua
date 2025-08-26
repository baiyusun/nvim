return {
  {
    "neovim/nvim-lspconfig",
    ft = { "python" },
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" }, -- 加入依赖，确保加载顺序
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.py" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}

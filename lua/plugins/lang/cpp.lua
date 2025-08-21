return {
  -- lsp config for c++
  {
    "neovim/nvim-lspconfig",
    ft = { "c", "cpp", "objc", "objcpp" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        capabilities = (function()
          local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
          if ok then
            return cmp_nvim_lsp.default_capabilities()
          else
            return vim.lsp.protocol.make_client_capabilities()
          end
        end)(),
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
          -- 格式化快捷键 <leader>cf
          vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = bufnr, desc = "Format C++ code" })
        end,
      })
      -- 自动保存时格式化
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },

  { "hrsh7th/cmp-nvim-lsp" },
}

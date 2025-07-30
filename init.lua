vim.opt.number = true
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable netrw at the very start of your init.lua
-- ~/.config/nvim/init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tab related options
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

require("config.lazy") -- ~/.config/nvim/lua/config.lua
require("keymapping")
require("options")
require("autocmds")
-- require("")

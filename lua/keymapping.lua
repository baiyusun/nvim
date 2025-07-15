-- leaderkey
vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>", { desc = "[lazy] Open Lazy.nvim" })

-- Save and Quit
vim.keymap.set("n", "S", "<CMD>w<CR>", { desc = "Save the changes" })
vim.keymap.set("n", "Q", "<CMD>q<CR>", { desc = "Quit" })

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")


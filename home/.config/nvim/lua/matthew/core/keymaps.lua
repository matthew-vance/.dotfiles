local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
s({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

s("i", "jk", "<Esc>", { desc = "Go to Normal mode" })

s("n", "<C-j>", "<C-w>j")
s("n", "<C-k>", "<C-w>k")
s("n", "<C-l>", "<C-w>l")
s("n", "<C-h>", "<C-w>h")

s("n", "<Tab>", "<C-6>")
s("n", "<C-x>", "<cmd>close<CR>")

local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
s({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

s("i", "jk", "<Esc>", { desc = "Go to Normal mode" })

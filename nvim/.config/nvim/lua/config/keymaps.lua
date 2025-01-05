local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

s({ "n", "v" }, "<space>", "<nop>", { silent = true })

s("i", "jk", "<esc>", { desc = "Go to Normal mode" })

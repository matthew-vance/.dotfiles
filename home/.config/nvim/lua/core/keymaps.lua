local s = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
s({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

s("i", "jj", "<Esc>", { desc = "Go to Normal mode" })

s({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
s("n", "gp", '"+p', { desc = "Paste from system clipboard" })
s("x", "gp", '"+P', { desc = "Paste from system clipboard" })

s("n", "<leader>s", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
s({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

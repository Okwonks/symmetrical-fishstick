vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<leader>n", "<cmd>set nu!<CR>")
map("n", "<leader>rn", "<cmd>set rnu!<CR>")

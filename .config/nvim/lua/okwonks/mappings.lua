vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>n", "<cmd>set nu!<CR>")
map("n", "<leader>rn", "<cmd>set rnu!<CR>")

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

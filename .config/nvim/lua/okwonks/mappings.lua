local utils = require("okwonks.utils")

vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>n", "<cmd>set nu!<CR>")
map("n", "<leader>rn", "<cmd>set rnu!<CR>")
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })

map("n", "<leader>x", utils.smart_close_buffer, { desc = "Close buffer safely" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- bufferline
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
map("n", "<leader>bp", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

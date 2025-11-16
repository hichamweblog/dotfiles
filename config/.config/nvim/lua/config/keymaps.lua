-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Better window navigation (alternative to Ctrl+hjkl)
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

-- Split windows
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Save file with Ctrl+s (works in normal, insert, and visual mode)
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Better paste (doesn't yank replaced text)
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Quickfix list navigation
map("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
map("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })
map("n", "<leader>qn", ":cnext<CR>", { desc = "Next quickfix item" })
map("n", "<leader>qp", ":cprev<CR>", { desc = "Previous quickfix item" })

-- Diagnostics (LSP errors/warnings) - CORRECTED
map("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "List diagnostics" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.number = true -- Shows absolute line number on cursor line

-- Tabs & indentation (important for multi-language work)
opt.tabstop = 2 -- 2 spaces for tabs (common in JS/React)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one
opt.smartindent = true -- Smart indenting

-- Line wrapping
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case, assumes case-sensitive

-- Cursor line
opt.cursorline = true -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true
opt.background = "dark" -- Dark mode
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, eol, start

-- Clipboard (use system clipboard)
opt.clipboard = "unnamedplus" -- Use system clipboard as default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Performance
opt.updatetime = 250 -- Faster completion (4000ms default)
opt.timeoutlen = 300 -- Time to wait for mapped sequence to complete

-- Undo & backup
opt.undofile = true -- Save undo history
opt.swapfile = false -- Disable swap file

-- Scroll
opt.scrolloff = 8 -- Minimum lines to keep above/below cursor
opt.sidescrolloff = 8 -- Minimum columns to keep left/right of cursor

-- For Python (you can adjust per filetype later)
vim.g.python3_host_prog = vim.fn.exepath("python3") or vim.fn.exepath("python")

-- Python provider optimization (prevents slow startup)
vim.g.python3_host_prog = vim.fn.exepath("python3") or vim.fn.exepath("python")
vim.g.python_host_prog = vim.fn.exepath("python2") or vim.fn.exepath("python")

-- Disable unused providers for faster startup
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

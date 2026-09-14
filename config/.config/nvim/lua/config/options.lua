-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Line numbers & gutter spacing (VSCode-like relative numbers with breathing room)
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.signcolumn = "auto"
opt.cursorline = true
opt.cursorlineopt = "both"

-- Tabs & indentation (VSCode tabSize = 2)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping (soft wrap)
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- Clean VSCode-like editor canvas
opt.termguicolors = true
opt.background = "dark"
opt.showmode = false
opt.laststatus = 2
opt.cmdheight = 0
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = " ",
  foldsep = " ",
  foldclose = " ",
  diff = "╱",
}
opt.guifont = "JetBrainsMono Nerd Font:h12,FiraCode Nerd Font:h12"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Undo & backup
opt.undofile = true
opt.swapfile = false

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Python provider (single assignment, no python2)
vim.g.python3_host_prog = vim.fn.exepath("python3") or vim.fn.exepath("python")

-- Disable unused providers for faster startup
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

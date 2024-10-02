local opt = vim.opt

vim.g.mapleader = " "

-- Basic Options
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.swapfile = false
opt.wrap = false
opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.backspace = { 'indent', 'eol', 'start' }

opt.mouse = 'a'
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.timeoutlen = 300
opt.updatetime = 300
opt.hidden = true

opt.list = true
opt.listchars = { tab = '» ', trail = '•', extends = '›', precedes = '‹', nbsp = '·' }

opt.ignorecase = true
opt.smartcase = true
opt.showmode = false

opt.hlsearch = true
opt.incsearch = true

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99

opt.ruler = true
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

opt.termguicolors = true
opt.background = 'dark'

opt.fillchars:append({ eob = ' ' })

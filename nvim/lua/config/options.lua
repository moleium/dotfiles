local opt = vim.opt

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
opt.cursorline = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.timeoutlen = 300
opt.updatetime = 250
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
opt.completeopt = { "menu", "menuone", "noselect" }

opt.termguicolors = true
opt.background = 'dark'

opt.fillchars:append({ eob = ' ' })

opt.cmdheight = 0
opt.pumheight = 10
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
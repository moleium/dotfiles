source maps.vim

call plug#begin('C:/Users/Mole/AppData/Local/nvim/plugged/init.vim')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

colorscheme tokyonight

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
syntax enable

set noswapfile
set wrap

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set backspace=indent,eol,start

set mouse=a
set cursorline
set guicursor=n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20
set matchpairs+=<:>,(:),[:],{:}

set scrolloff=3
set sidescrolloff=7

set notimeout
set hidden

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set number

set ignorecase
set smartcase
set showmode

set hlsearch

set foldmethod=indent
set foldlevel=99

set ruler
set completeopt=menuone,noinsert,noselect
set statusline=%F\ %l\:%c

augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

hi SignColumn guibg=bg

" Disable tildes for retarded blank lines
set fillchars+=eob:\ 

" Transparent background :3
highlight Normal guibg=NONE ctermbg=NONE

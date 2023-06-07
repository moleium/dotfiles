" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

" Control-Q exit
nmap <C-Q> :q<cr>
vmap <C-Q> <esc>:q<cr>
imap <C-Q> <esc>:q<cr>

" Insert mode movement
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
imap <M-f> <C-right>
imap <M-b> <C-left>

" Back to normal mode from insert
inoremap jk <esc>
inoremap JK <esc>

" Quick edit init.vim
nnoremap <silent>,init :tabe ~/.config/nvim/init.vim<cr>
nnoremap <silent>,so :so ~/.config/nvim/init.vim<cr>:echo 'sourced'<cr>

" Open NERDTree file explorer with <Ctrl-n>
nnoremap <C-n> :NERDTreeToggle<CR>

" Toggle line numbers with <F3>
nnoremap <F3> :set invnumber<CR>

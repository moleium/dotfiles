local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window Navigation
-- <C-h> - Move to left window
-- <C-j> - Move to bottom window  
-- <C-k> - Move to top window
-- <C-l> - Move to right window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Window Resizing
-- <C-Up>    - Decrease window height
-- <C-Down>  - Increase window height
-- <C-Left>  - Decrease window width
-- <C-Right> - Increase window width
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Buffer Navigation
-- <S-l> - Next buffer
-- <S-h> - Previous buffer
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Better Indenting
-- < - Decrease indent and reselect
-- > - Increase indent and reselect
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move Text Up and Down
-- <A-j> - Move selected text down
-- <A-k> - Move selected text up
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- File Explorer
-- <leader>e - Toggle NvimTree
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        keymap('n', '<leader>e', function()
            require('nvim-tree.api').tree.toggle()
        end, opts)
    end
})

-- Clear Search Highlighting
-- <leader>h - Clear search highlights
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Better Paste
-- p - Paste without yanking replaced text
keymap('v', 'p', '"_dP', opts)

-- Save File
-- <C-s> - Save current buffer
keymap('n', '<C-s>', ':w<CR>', opts)

-- Close Buffer
-- <C-q> - Close current buffer
keymap('n', '<C-q>', ':bd<CR>', opts)
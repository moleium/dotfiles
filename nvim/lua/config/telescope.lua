local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = {"smart"},
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
}

-- Keybinds
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("GREP> ") })
end, { noremap = true, silent = true })

vim.cmd [[autocmd VimEnter * ++once lua require('telescope.builtin')]]

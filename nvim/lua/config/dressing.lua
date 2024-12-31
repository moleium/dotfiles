require('dressing').setup {
  input = {
    enabled = true,
    default_prompt = "Input:",
    prompt_align = "left",
    insert_only = true,
    border = "rounded",
    relative = "cursor",
    prefer_width = 40,
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
  },
  select = {
    enabled = true,
    backend = { "telescope", "builtin" },
    telescope = require('telescope.themes').get_dropdown(),
    builtin = {
      border = "rounded",
      relative = "cursor",
      win_options = {
        winblend = 10,
        winhighlight = "",
      },
    },
  },
} 
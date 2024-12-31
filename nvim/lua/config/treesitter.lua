require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "c",
    "rust",
    "lua",
    "markdown",
    "markdown_inline"
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
    custom_captures = {
      ["variable"] = "TSVariable",
      ["reference"] = "TSReference"
    },
  },

  indent = {
    enable = true,
    disable = {},
  }
}
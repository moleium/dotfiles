require('lualine').setup {
  options = {
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color = {
          added    = { fg = '#98be65' },
          modified = { fg = '#FF8800' },
          removed  = { fg = '#ec5f67' },
        },
      },
      'diagnostics'
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        file_status = true,
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

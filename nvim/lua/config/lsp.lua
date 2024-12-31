local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.clangd.setup{
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  end,
}

nvim_lsp.lua_ls.setup({
  cmd = { "lua-language-server" },
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
        globals = { "describe", "it", "assert", "vim", "hs" },
      },
      hint = {
        enable = true,
      },
      format = {
        enable = true,
        defaultConfig = {
          quote_style = "double",
          indent_style = "tab",
          indent_size = "1",
          table_separator_style = "comma",
          trailing_table_separator = "smart",
          keep_line_after_if_statement = "maxLine:1",
          keep_line_after_do_statement = "maxLine:1",
          keep_line_after_while_statement = "maxLine:1",
          keep_line_after_repeat_statement = "maxLine:1",
          keep_line_after_for_statement = "maxLine:1",
          keep_line_after_local_or_assign_statement = "maxLine:1",
          keep_line_after_function_define_statement = "keepLine:1",
          keep_line_after_expression_statement = "maxLine:1",
        },
      },
    },
  },
})
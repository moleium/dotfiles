local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
    highlight_whole_line = false,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    max_width = math.floor(vim.o.columns * 0.6),
    max_height = math.floor(vim.o.lines * 0.4),
  },
})

vim.opt.updatetime = 250

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
    focusable = false,
    style = "minimal",
    max_width = math.floor(vim.o.columns * 0.5),
    max_height = math.floor(vim.o.lines * 0.4),
    wrap = true,
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
    focusable = false,
    style = "minimal",
    max_width = math.floor(vim.o.columns * 0.5),
  }
)

local function common_on_attach(client, bufnr)
  local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    opts.noremap = true
    opts.silent = true
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
  map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
  map('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })
  map('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })

  map('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover documentation' })
  map('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

  map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
  map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Show code actions' })

  map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
  map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
  map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
  map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Add diagnostics to location list' })

  map('n', '<leader>vl', function()
    local current_config = vim.diagnostic.config()
    local new_config = not current_config.virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
  end, { desc = 'Toggle diagnostic virtual lines' })

  if client.server_capabilities.documentFormattingProvider then
    local format_group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ 
          bufnr = bufnr, 
          timeout_ms = 2000,
          filter = function(format_client)
            return format_client.name == client.name
          end
        })
      end,
    })
  end
end

nvim_lsp.clangd.setup{
  cmd = { 
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
    "--header-insertion=iwyu",
    "--cross-file-rename",
    "--suggest-missing-includes"
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  capabilities = capabilities,
  on_attach = common_on_attach,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
}

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    
    local function ts_map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { 
        buffer = bufnr, 
        noremap = true, 
        silent = true, 
        desc = desc 
      })
    end
    
    ts_map('<leader>to', '<Cmd>TSToolsOrganizeImports<CR>', 'Organize imports')
    ts_map('<leader>tu', '<Cmd>TSToolsRemoveUnused<CR>', 'Remove unused imports')
    ts_map('<leader>ta', '<Cmd>TSToolsAddMissingImports<CR>', 'Add missing imports')
    ts_map('<leader>tf', '<Cmd>TSToolsFixAll<CR>', 'Fix all issues')
    ts_map('<leader>tr', '<Cmd>TSToolsRenameFile<CR>', 'Rename file')
    ts_map('<leader>ti', '<Cmd>TSToolsFileReferences<CR>', 'Show file references')
  end,
  capabilities = capabilities,
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = "insert_leave",
    expose_as_code_action = "all",
    complete_function_calls = true,
    include_completions_with_insert_text = true,
    
    tsserver_file_preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
      includeCompletionsWithSnippetText = true,
      includePackageJsonAutoImports = "auto",
      includeAutomaticOptionalChainCompletions = true,
      
      includeInlayParameterNameHints = "literals",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = false,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = false,
      
      providePrefixAndSuffixTextForRename = true,
      allowRenameOfImportPath = true,
      allowTextChangesInNewFiles = true,
      displayPartsForJSDoc = true,
      generateReturnInDocTemplate = true,
    },
    
    tsserver_format_options = {
      allowIncompleteCompletions = false,
      allowRenameOfImportPath = true,
      insertSpaceAfterCommaDelimiter = true,
      insertSpaceAfterSemicolonInForStatements = true,
      insertSpaceBeforeAndAfterBinaryOperators = true,
      insertSpaceAfterConstructor = true,
      insertSpaceAfterKeywordsInControlFlowStatements = true,
      insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
      insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
      insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
      insertSpaceAfterTypeAssertion = false,
      insertSpaceBeforeFunctionParenthesis = false,
      placeOpenBraceOnNewLineForFunctions = false,
      placeOpenBraceOnNewLineForControlBlocks = false,
      insertSpaceBeforeTypeAnnotation = false,
      indentMultiLineObjectLiteralBeginningOnBlankLine = false,
      semicolons = "insert",
    },
    
    tsserver_max_memory = "auto",
    tsserver_locale = "en",
  },
})


-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- IDE
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-W>]', '<C-W>v<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', ',i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ',c', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n', ',gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', ',sr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ',se', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', ',R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- LSP
  buf_set_keymap('n', ',li', '<cmd>LspInfo<CR>', opts)
  buf_set_keymap('n', ',lr', '<cmd>LspRestart<CR>', opts)
end

-- Put here lsp servers that don't require special config
local lspconfig = require('lspconfig')
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = function(fname)
      -- Return first .git directory or if not found, first with .gitignore
      return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.root_pattern(".gitignore")(fname)
    end;
  }
end

-- gopls lsp config
lspconfig.gopls.setup{
  on_attach = on_attach,
  root_dir = function(fname)
    -- Return go.mod dir as root, if not found use first git repo 
    return lspconfig.util.root_pattern("go.mod")(fname) or lspconfig.util.find_git_ancestor(fname)
  end;
}

-- elixirls lsp config
lspconfig.elixirls.setup{
  cmd = { "/Users/pablo.alcalde/Documents/Projects/elixir-ls-source/language_server.sh" },
  on_attach = on_attach,
}

-- Set log level to debug for easy debugging problems
vim.lsp.set_log_level("info")

-- Format on save
vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]

-- disable publishDiagnostics, I use ALE instead
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = false,
  signs = false,
  update_in_insert = false,
}
)

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "go",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {  },

  highlight = {
    enable = true,
    -- Setting this to true will run `syntax` highlighting with tree-sitter at the same time
    additional_vim_regex_highlighting = false,
  },
}

 require('nvim-cursorline').setup {
   cursorline = {
     enable = true,
     timeout = 1000,
     number = false,
   },
   cursorword = {
     enable = true,
     min_length = 3,
     hl = { underline = true },
   }
 }

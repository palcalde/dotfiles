-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require 'illuminate'.on_attach(client)
  require "lsp_signature".on_attach(clinet)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Jump to next LSP diag, if not exist then try with ALE's ones  
  function next_diagnostic()
    if vim.diagnostic.get_next_pos() == false then 
      vim.call('execute', 'ALENextWrap')
    else
      vim.diagnostic.goto_next({ float = false })
    end
  end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- IDE
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-W>]', '<C-W>v<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', ',i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ',c', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n', ',e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', ',rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', ',n', '<cmd>lua next_diagnostic()<CR>', opts)
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
vim.lsp.set_log_level("trace")

-- Format on save
vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]

-- disable publishDiagnostics, I use ALE instead
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
  signs = false,
  update_in_insert = false,
}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = "single" })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "single" })


set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require'lspconfig'.gopls.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', "", opts)
buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
buf_set_keymap('n', 'gC', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', ',q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Format on save
vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]

-- Telescope keymappings
-- local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- require('telescope').setup{
-- defaults = {
--   mappings = {
--     i = {
--       ["<C-j>"] = actions.move_selection_next,
--       ["<C-k>"] = actions.move_selection_previous,
--       ["<esc>"] = actions.close,
--       },
--     },
--   }
-- } 
EOF

" Find files using Telescope command-line sugar.
" nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
" nnoremap <silent> <leader><space> <cmd>Telescope buffers<cr>
" nnoremap <silent> <leader>h <cmd>Telescope oldfiles<cr>
" nnoremap <silent> <leader>sw <cmd>Telescope grep_string<cr>
" nnoremap <silent> <leader>a <cmd>Telescope live_grep<cr>

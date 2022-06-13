
-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach(clinet)

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

 -- require('nvim-cursorline').setup {
 --   cursorline = {
 --     enable = true,
 --     timeout = 1000,
 --     number = false,
 --   },
 --   cursorword = {
 --     enable = true,
 --     min_length = 3,
 --     hl = { underline = true },
 --   }
 -- }

 -- nvim-cmp
 --
 local icons = {
   Text = "",
   Method = "",
   Function = "",
   Constructor = "",
   Field = "ﰠ",
   Variable = "",
   Class = "ﴯ",
   Interface = "",
   Module = "",
   Property = "ﰠ",
   Unit = "塞",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "פּ",
   Event = "",
   Operator = "",
   TypeParameter = "",
 }

 local present, cmp = pcall(require, "cmp")

 if not present then
   return
 end

 local luasnip_present, luasnip = pcall(require, "luasnip")

 cmp.setup({
   -- Disable for comments
   enabled = function ()
     local context = require 'cmp.config.context'
     -- keep command mode completion enabled when cursor is in a comment
     if vim.api.nvim_get_mode().mode == 'c' then
       return true
     else
       return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
     end
   end,
   completion = {
     completeopt = "menu,menuone,noselect",
   },
   preselect = cmp.PreselectMode.None,
   window = {
     documentation = cmp.config.window.bordered(),
     completion = cmp.config.window.bordered(),
   },
   snippet = {
     expand = function(args)
       vim.fn["UltiSnips#Anon"](args.body)
     end,
   },
   formatting = {
     format = function(entry, vim_item)
       vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

       vim_item.menu = ({
         buffer = "[Buffer]",
         nvim_lsp = "[LSP]",
         cmp_tabnine = "[Tabnine]",
         path = "[Path]",
       })[entry.source.name]

       return vim_item
     end,
   },
   mapping = {
     ["<C-p>"] = cmp.mapping.select_prev_item(),
     ["<C-n>"] = cmp.mapping.select_next_item(),
     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
     ["<C-f>"] = cmp.mapping.scroll_docs(4),
     ["<C-Space>"] = cmp.mapping.complete(),
     ["<C-e>"] = cmp.mapping.close(),
     ["<CR>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Replace,
       select = true,
     },
     ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       else
         fallback()
       end
     end, { "i", "s" }),
     ["<S-Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_prev_item()
       else
         fallback()
       end
     end, { "i", "s" }),
   },
   -- Order matters: it will determine the prioritization of sources when showing autocomplete suggestions
   sources = {
     { name = "cmp_tabnine", max_item_count = 5 },
     { name = "nvim_lsp", max_item_count = 5 },
     { name = 'ultisnips', max_item_count = 5 },
     { name = "buffer" },
     { name = "path" },
     { name = "dap" },
   },
   -- TODO: Ideally, we would remove the comparators we don't want instead of adding the ones we do, so that when new ones are added we don't miss them
   -- sorting = {
     --     comparators = {
       --         cmp.config.compare.offset,
       --         cmp.config.compare.exact,
       --         cmp.config.compare.score,
       --         cmp.config.compare.recently_used,
       --         cmp.config.compare.kind,
       --         cmp.config.compare.sort_text,
       --         cmp.config.compare.length,
       --         cmp.config.compare.order,
       --         cmp.config.compare.locality,
       --         cmp.config.compare.scopes,
       --     },
       -- },
     })

     cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'git' },
       }, {
         { name = 'buffer' },
       })
     })

     -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline('/', {
       mapping = cmp.mapping.preset.cmdline(),
       sources = {
         { name = 'buffer' }
       }
     })

     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline(':', {
       mapping = cmp.mapping.preset.cmdline(),
       sources = cmp.config.sources({
         { name = 'path' }
       }, {
         { name = 'cmdline' }
       })
     })

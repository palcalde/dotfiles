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

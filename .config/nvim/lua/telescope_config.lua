require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
		["<C-p>"] = require('telescope.actions').cycle_history_prev,
		["<C-n>"] = require('telescope.actions').cycle_history_next,
        ["<esc>"] = require('telescope.actions').close,
      }
    }
  },
  pickers = {},
  extensions = {}
}

require('telescope').load_extension('fzf')

-- override vimgrep_arguments default value so telescope grep_string and live_grep both use rg command with --hidden flag 
rg_command = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--hidden", "--smart-case" }
require'telescope.config'.set_defaults({vimgrep_arguments=rg_command})

-- create Rg command (will override fzf's one) to trigger telescope.grep_string with rg configured to show hidden files
vim.cmd("command! -nargs=1 Rg lua require'telescope.builtin'.grep_string{search=<q-args>}")


local opt = vim.opt

opt.wildignore:prepend { "~/.vim", "runtimepath" }
opt.wildignore:append { "~/.vim/after", "runtimepath" }

vim.cmd("source ~/.vimrc")

-- Load configs
require("lsp_config")
require("cmp_config")
require("treesitter_config")
require("tree_config")
require("telescope_config")
require("supermaven_config")

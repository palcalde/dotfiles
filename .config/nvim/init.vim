set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

 " Load configs
lua require("lsp_config")
lua require("cmp_config")
lua require("treesitter_config")

lua << EOF
EOF

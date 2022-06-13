set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

 " Load lsp_config.lua
lua require("lsp_config")
lua require("cmp_config")

lua << EOF
EOF

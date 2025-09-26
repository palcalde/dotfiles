local opt = vim.opt

opt.wildignore:prepend { "~/.vim", "runtimepath" }
opt.wildignore:append { "~/.vim/after", "runtimepath" }

vim.cmd("source ~/.vimrc")

-- Specific things for VIM in terminal
if vim.g.vscode == nil then
	vim.g.ale_enabled = 1
	-- Load configs
	require("lsp_config")
	require("cmp_config")
	require("treesitter_config")
	require("tree_config")
	require("telescope_config")
	require("supermaven_config")
end


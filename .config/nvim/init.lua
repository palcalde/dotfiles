local opt = vim.opt

opt.wildignore:prepend { "~/.vim", "runtimepath" }
opt.wildignore:append { "~/.vim/after", "runtimepath" }

vim.cmd("source ~/.vimrc")

-- Check if term doesn't come from vscode
-- as it interfieres with cursor neovim plugin
if vim.g.vscode == nil then
	-- Load configs
	require("lsp_config")
	require("cmp_config")
	require("treesitter_config")
	require("tree_config")
	require("telescope_config")
	require("supermaven_config")
end


 local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- copy defaults
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's',   api.node.open.vertical,              opts('Open: Vertical Split'))
  end

require'nvim-tree'.setup {
	on_attach = my_on_attach,
    update_cwd = true,
	reload_on_bufenter = true,
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
		update_cwd = false,
    },

    renderer = {
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
                folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
            },
        },
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },

    filters = {
        dotfiles = false,
        custom = {"^\\.git$"},
    },

    actions = {
        open_file = {
			window_picker = {
				enable = false,
			},
            quit_on_open = false,
        },
    },
}

-- configure nvim to open on startup
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

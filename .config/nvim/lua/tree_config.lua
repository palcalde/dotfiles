require'nvim-tree'.setup {
    open_on_setup = true,
    update_cwd = true,
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
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
        custom = {"^\\.git"},
    },

    view = {
        mappings = {
            list = {
                { key = {"<CR>", "l" }, action = "edit", mode = "n"},
                { key = {"<BS>", "h" }, action = "close_node", mode = "n"},
            }
        }
    },

    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
}

-- exit vim after closing last opened buff
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

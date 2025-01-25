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
    Copilot = "",
}

local present, cmp = pcall(require, "cmp")

if not present then
	return
end

local luasnip_present, luasnip = pcall(require, "luasnip")

cmp.setup({
	-- Don't auto select the first entry
	preselect = cmp.PreselectMode.None,
	enabled = function ()
		-- disable autocompletion in prompt (wasn't playing good with telescope)
		buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then return false end

		local context = require 'cmp.config.context'
		-- disable autocompletion in comments 
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end,
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				path = "[Path]",
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
	},
	-- Order matters: it will determine the prioritization of sources when showing autocomplete suggestions
	sources = {
		-- { name = "supermaven"},
		{ name = "nvim_lsp"},
		{ name = "path"},
		{ name = 'nvim_lsp_signature_help'},
		{ name = "buffer" },
	},
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


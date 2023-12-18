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
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				cmp_tabnine = "[Tabnine]",
				path = "[Path]",
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
		-- if trouble when there is text behind, check has_words_before method in copilot-cmp repo: https://github.com/zbirenbaum/copilot-cmp/issues/79
		["<Tab>"] = vim.schedule_wrap(
			function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end),
		["<S-Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end, { "i", "s" }),
	},
	-- Order matters: it will determine the prioritization of sources when showing autocomplete suggestions
	sources = {
	    { name = "copilot", group_index = 2},
		{ name = "nvim_lsp"},
		{ name = 'ultisnips'},
		-- { name = "buffer" },
		{ name = "path" },
		-- { name = "dap" },
		-- { name = 'nvim_lsp_signature_help' },
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


vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.opt.shortmess:append "c"

require("lspkind").init({})
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

require("luasnip").config.set_config({
	history = false,
	updateevents = "TextChanged,TextChanged",
})

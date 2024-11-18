return {
	"tpope/vim-sleuth",
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}

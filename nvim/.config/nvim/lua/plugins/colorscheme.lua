return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
		vim.cmd.hi("Comment gui=none")
	end,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	-- "AlphaTechnolog/pywal.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("pywal")
	-- 	vim.cmd.hi("Comment gui=none")
	-- end,
}

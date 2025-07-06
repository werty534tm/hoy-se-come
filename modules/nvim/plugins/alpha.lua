local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local ascii = require("resources.ascii")

dashboard.section.header.val = ascii.blasphemia

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("c", "  Config nvim", ":e ~/.config/nvim<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.config)

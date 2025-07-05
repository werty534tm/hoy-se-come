-- (Obtain yazi.nvim and its dependencies using your preferred method first)
--
-- Next, map a key to open yazi.nvim
vim.keymap.set("n", "<leader>e", function()
  require("yazi").yazi()
end)

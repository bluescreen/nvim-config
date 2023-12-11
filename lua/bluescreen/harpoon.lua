
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup({
    tabline = true,
    tabline_prefix = "   ",
    tabline_suffix = "   "
})
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.keymap.set('n', "<leader>a", mark.add_file)
vim.keymap.set('n', "<C-h>", ui.nav_file(1))
vim.keymap.set('n', "<C-j>", ui.nav_file(2))
vim.keymap.set('n', "<C-k>", ui.nav_file(3))
vim.keymap.set('n', "<C-l>", ui.nav_file(4))
vim.keymap.set('n', "<C-ö>", ui.nav_file(5))
vim.keymap.set('n', "<C-ä>", ui.nav_file(6))
vim.keymap.set('n', "<C-g>", ui.toggle_quick_menu)

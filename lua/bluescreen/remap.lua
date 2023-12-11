vim.g.mapleader = " "

-- Open UI Components
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<C-p>", vim.cmd.telescope)
vim.keymap.set("n","<C-n>", vim.cmd.NERDTreeToggle)

-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Copy & Paste
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

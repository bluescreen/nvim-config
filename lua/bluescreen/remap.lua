vim.g.mapleader = " "

local map = vim.keymap.set

-- Util
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Open UI Components
map("n","<leader>pv", vim.cmd.Ex)
map("n","<C-p>", vim.cmd.telescope)
map("n","<C-n>", vim.cmd.NERDTreeToggle)
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


-- Copy & Paste
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({"n", "v"}, "<leader>d", [["_d]])

-- Search
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
vim.cmd("colorscheme tokyonight-night")

 vim.cmd("set tabstop=4")
 vim.cmd("set softtabstop=4")
 vim.cmd("set colorcolumn=81")
 vim.cmd("set shiftwidth=4")
 vim.cmd("set smartindent")
 vim.cmd("set autoindent")
 vim.cmd("set nu")
 vim.cmd("set hidden")
 vim.cmd("set rnu")
 vim.cmd("set nowrap")
 vim.cmd("set smartcase")
 vim.cmd("set noswapfile")
 vim.cmd("set undodir=~/.vim/undodir")
 vim.cmd("set undofile")
 vim.cmd("set incsearch")
 vim.cmd("set splitright")
 vim.cmd("set splitbelow")
 vim.cmd("set mouse=a")
 vim.cmd("set cursorline")
 vim.cmd("set colorcolumn=80")
 vim.cmd("set nrformats-=octal")
 vim.cmd("set tags=tags")
 vim.cmd("set completeopt=menuone,noselect")
 vim.cmd("set laststatus=3")

vim.g["test#javascript#runner"] = "jest"
vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#jest#options"] = {
  all = "--silent",
}

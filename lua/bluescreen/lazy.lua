local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-lua/popup.nvim'},

    -- Default Vim Plugins
    {'scrooloose/nerdtree'},
    {'airblade/vim-gitgutter'},
    {'vim-airline/vim-airline'},
    {'tpope/vim-surround'},
    {'tpope/vim-fugitive'},
    {'jiangmiao/auto-pairs'},
    {'sheerun/vim-polyglot'},


    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},


    -- Prime Plugins
    {'ThePrimeagen/harpoon'},
    {'ThePrimeagen/refactoring.nvim'},
    {'ThePrimeagen/vim-be-good'},
    {'ThePrimeagen/git-worktree.nvim'},

    -- LSP

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    -- Theme
    {"folke/tokyonight.nvim",lazy = false,priority = 1000,opts = {}},
    {'kyazdani42/nvim-web-devicons'},


    -- Tresitter
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/playground'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
}
local opts = {}

require("lazy").setup(plugins, opts)

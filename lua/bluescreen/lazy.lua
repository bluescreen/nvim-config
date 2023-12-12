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
    {'mbbill/undotree'},


    -- Fun Stuff 
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        local logo = [[                                
      :@@@@@@@    @@@@@@    @@@    @@    @@  @@@                      
        :@@   @@@   @@        @@@@@  @@    @@.@@@                        
        :@@    @@   @@@@@@    @@ +@@ @@    @@@@@                         
        :@@   @@@   @@        @@   @@@@    @@  @@@                       
        :@@@@@@     @@@@@@    @@     @@    @@   @@@                      
                                                                         
   @@@    @@@     @@  @@@@@@@   @@@@@@@    @@   @@@                      
    @@   @@@@@   @@   @@        @@:   @@   @@ @@@                        
     @@  @@ @@@ @@    @@@@@@@   @@@@@@@@   @@@@@                         
     =@@@@   @@@@@    @@        @@@@@@     @@  @@                        
                 @@@     @@@     @@@@@@@   @@:  @@    @@   @@@                                 
        ]]
        logo = string.rep("\n", 1) .. logo .. "\n\n"
        require('dashboard').setup {
          theme = "doom",
          config = {
            header = vim.split(logo, "\n"),
            packages = { enable = false },
            week_header = {
              enable = false
            },
            center = {
              { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
              { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
              { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
              { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
              { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            }

          }
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- Formatter 
    {'stevearc/conform.nvim'},

    -- Folke
    {"folke/tokyonight.nvim",lazy = false,priority = 1000,opts = {}},
    {'folke/trouble.nvim'},
    {'folke/zen-mode.nvim', opts = {window ={ options = {number = true, relativenumber = true}}}},
    {
      "folke/persistence.nvim",
      event = "BufReadPre", 
    },

    -- TJ
    {'nvim-telescope/telescope-ui-select.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},


    -- Prime Plugins
    {'ThePrimeagen/harpoon'},
    {'ThePrimeagen/refactoring.nvim'},
    {'ThePrimeagen/vim-be-good'},
    {'ThePrimeagen/git-worktree.nvim'},

    -- LSP

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    -- Theme
    {'kyazdani42/nvim-web-devicons'},


    -- Tresitter
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/playground'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
}
local opts = {}

require("lazy").setup(plugins, opts)

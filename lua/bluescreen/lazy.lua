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
    {'scrooloose/nerdtree', event = "VeryLazy"},
    {'airblade/vim-gitgutter'},
    {'vim-airline/vim-airline'},
    {'tpope/vim-surround'},
    {'tpope/vim-fugitive', event = "VeryLazy"},
    {'tpope/vim-commentary'},
    {'jiangmiao/auto-pairs'},
    {'sheerun/vim-polyglot', event = "VeryLazy"},
    {'mbbill/undotree', event = "VeryLazy"},


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
    {'folke/which-key.nvim', event = "VeryLazy"},
    {'folke/zen-mode.nvim', opts = {window ={ options = {number = true, relativenumber = true}}}},
    {
      "folke/persistence.nvim",
      event = "BufReadPre", 
    },

    -- TJ
    {'nvim-telescope/telescope-ui-select.nvim', event = "VeryLazy"},
    {'nvim-telescope/telescope-fzy-native.nvim', event = "VeryLazy"},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},


    -- Prime Plugins
    {'ThePrimeagen/harpoon', event = "VeryLazy"},
    {'ThePrimeagen/refactoring.nvim', event = "VeryLazy"},
    {'ThePrimeagen/vim-be-good', event = "VeryLazy"},
    {'ThePrimeagen/git-worktree.nvim', event = "VeryLazy"},

    -- LSP

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip', event = "VeryLazy"},

    -- Theme
    {'kyazdani42/nvim-web-devicons'},


    -- Tresitter
    {'nvim-treesitter/nvim-treesitter', event = "VeryLazy"},
    {'nvim-treesitter/nvim-treesitter-context', event = "VeryLazy"},
    {'nvim-treesitter/playground', event = "VeryLazy"},
    {'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy"},
}
local opts = {}

require("lazy").setup(plugins, opts)

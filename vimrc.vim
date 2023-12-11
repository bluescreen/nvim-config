

let mapleader = "\<Space>"
let test#strategy = "neovim"
"Key mapppings
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" Windows
nmap <C-Down> <C-W>j
nmap <C-Up> <C-W>k
nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l

nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Tabs
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Exit insert mode easy
inoremap kj <Esc>
" New line in insert mode
" inoremap <C-k> <Esc>O<Esc>jA
" save and exit insert mode
noremap <C-s> <Esc>:w<CR><Esc>
" dupplicate line
" noremap <C-d> yyp

inoremap <C-e> <C-o>
" Enable scroll in terminal
tnoremap <Esc><Esc> <C-\><C-n>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nmap <leader>f gg=G<C-o><C-o>
noremap <C-n> :NERDTreeToggle<CR>
" if has('nvim')
" noremap <C-t> :vsplit term://zsh<CR>
" else
" noremap <C-t> :vert terminal<CR>
" endif

":nmap <c-R> :CtrlPBufTag<cr>
nmap <leader>ai mzgg=G`z
nmap <leader>rv :source ~/.vimrc<CR>
nmap <leader>rvv :source ~/.config/nvim/init.vim<CR>
nmap <leader>evv :tabedit ~/.config/nvim/init.vim<CR>
nmap <leader>ev :tabedit ~/.vimrc<CR>
nmap <leader>r :Telescope lsp_references<CR>

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set colorcolumn=81
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nu
set hidden
set rnu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitright
set splitbelow
set mouse=a
set cursorline
set colorcolumn=80
set nrformats-=octal
set tags=tags
set completeopt=menuone,noselect
set laststatus=3
highlight WinSeperator guibg=None

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Git & History
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-cucumber'

Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'

Plug 'chaquotay/ftl-vim-syntax'

Plug 'vim-test/vim-test'

Plug 'kshenoy/vim-signature'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'


if has('nvim')
    " LSP
    " Plug 'Pocco81/AutoSave.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    Plug 'ThePrimeagen/harpoon'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'

    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'ThePrimeagen/refactoring.nvim'
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'ThePrimeagen/git-worktree.nvim'


    " learning
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'alx741/vim-rustfmt'

    " Theme
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
else
    Plug 'mattn/vim-lsp-settings'
    Plug 'gruvbox-community/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
endif

call plug#end()



let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|bower_components|vendor'

colorscheme tokyonight-night
set background=dark
" set termguicolors
highlight Cursor guifg=white guibg=black

highlight iCursor guifg=white guibg=steelblue
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

hi! Normal ctermbg=NONE guibg=NONE
:hi! NonText ctermbg=NONE guibg=NONE ctermfg=NONE
let g:netrw_winsize = 25
nnoremap <leader>u :UndoTreeShow<CR>
nnoremap <C-p> :Telescope find_files<CR>
" nnoremap <C-t> :Telescope live_grep<CR>
nnoremap <leader>t :Telescope<CR>
" nnoremap <C-T> :TestNearest<CR>
nnoremap <leader>z :TSPlaygroundToggle<CR>
nnoremap <leader>l :!yarn lint %<CR>

let g:indentLine_char       = '▏'
let g:indentLine_setConceal = 0
let NERDTreeShowHidden = 1 
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'
if has('nvim')
    let g:compe = {}
    let g:compe.enabled = v:true
    let g:compe.autocomplete = v:true
    let g:compe.debug = v:false
    let g:compe.min_length = 1
    let g:compe.preselect = 'enable'
    let g:compe.throttle_time = 80
    let g:compe.source_timeout = 200
    let g:compe.resolve_timeout = 800
    let g:compe.incomplete_delay = 400
    let g:compe.max_abbr_width = 100
    let g:compe.max_kind_width = 100
    let g:compe.max_menu_width = 100
    let g:compe.documentation = v:true

    let g:compe.source = {}
    let g:compe.source.path = v:true
    let g:compe.source.buffer = v:true
    let g:compe.source.calc = v:true
    let g:compe.source.nvim_lsp = v:true
    let g:compe.source.nvim_lua = v:true
    let g:compe.source.vsnip = v:true
    let g:compe.source.ultisnips = v:true
    let g:compe.source.luasnip = v:true
    let g:compe.source.emoji = v:true
endif

nmap <F8> :TagbarToggle<CR> 
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

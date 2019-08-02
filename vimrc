" THOMAS HOPE's .vimrc, constructed with help from the internet

set nocompatible            " Removes backwards compatability features for vi
filetype plugin on          " Enable plugins (required for netrw)

set tabstop=4               " Tabs look like 4 spaces
set shiftwidth=4            " How to indent with '>' or autoindent
set expandtab               " Tabs are expanded to spaces as you type
set autoindent              " Use same indentation when starting a newline
set scrolloff=10            " How many lines to keep above/bleow cursor

set ruler                   " Display line/col in lower right corner
set number                  " Display line numbers down the left hand side
set relativenumber          " Display line numbers realtive to the cursor

set foldmethod=syntax       " Fold code according to language syntax rules
set nofoldenable            " No folds when you first open a file
set foldlevelstart=99       " When you begin folding, everything starts open
" Use space to toggle folding
nnoremap <space> za

set hlsearch                " Highlight search results (disable with noh)
set incsearch               " Highlight searches as you type
set ignorecase              " 'ignorecase' and 'smartcase' together means search is case
set smartcase               " insensitive by default, untill you start using uppercase

set hidden                  " Allows switching buffers without saving
set showcmd                 " Show vim commands as you type them

" press tab to insert '//' at every selected line
xnoremap <Tab> :norm i//<CR>
" press shift tab to delete the first to chars of every line
xnoremap <S-Tab> :norm xx<CR>

nnoremap <F5> :! ./build.sh && ./run.sh<CR>
nnoremap <F7> :! ./build.sh<CR>

colorscheme spring-night    " ColorScheme from user rhysd on GitHub, place in ~/.vim/colors
syntax on                   " Turn on syntax highlighting

let g:ms_per_line=4

filetype off                " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Smooth scrolling for CTRL-f, CTRL-b, CTRL-d, CTRL-u, zt, zz, and zb
Plugin 'cskeeters/vim-smooth-scroll'
" TODO: scrolling with those key combos is actually nice, can it work
" for searching with 'n' and 'N' as that's what i seem to do much more often

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

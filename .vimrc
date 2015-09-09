" THOMAS HOPE

set nocompatible " removes backwards compatability features for vi
filetype off
set nomodeline

set hlsearch " highlight search results
set incsearch " search incrementaly
set ignorecase " case insensitive, except when using capitals
set smartcase
" clears search results by pressing escape
nnoremap <esc> :noh<return><esc>

set backspace=indent,eol,start
set autoindent
set ruler
set laststatus=2
set confirm
set number
set relativenumber
" no need to press shift when entering commands
nmap ; :

" indentation settings
set shiftwidth=4
set tabstop=4
set expandtab

" default configuration for You Complete Me
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" use control k to clang format
map <C-K> :pyf /usr/local/Cellar/clang-format/2015-04-21/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2015-04-21/share/clang/clang-format.py<cr>

" toggle nerd tree with control-n
map <C-n> :NERDTreeToggle<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugins
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'

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
" :PluginClean      - confirms removal of unused plugins; append `!` to :auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" setup colour scheme
syntax enable
set background=dark
colorscheme solarized

" Disable arrow keys to force me to be a good vim user
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

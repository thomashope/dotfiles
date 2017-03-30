" THOMAS HOPE's .vimrc, constructed with help from the internet

set nocompatible            " Removes backwards compatability features for vi

set tabstop=4               " Tabs look like 4 spaces
set shiftwidth=4            " How to indent with '>' or autoindent
set expandtab               " Tabs are expanded to spaces as you type
set autoindent              " Use same indentation when starting a newline

set ruler                   " Display line/col in lower right corner
set number                  " Display line numbers down the left hand side
set relativenumber          " Display line numbers realtive to the cursor

set foldmethod=syntax       " Fold code according to language syntax rules
set nofoldenable            " No folds when you first open a file
set foldlevelstart=99       " When you begin folding, everything starts open
" Use space to toggle folding
nnoremap <space> za

set hidden                  " Allows switching buffers without saving
set showcmd                 " Show vim commands as you type them

colorscheme spring-night    " ColorScheme from user rhysd on GitHub, place in ~/.vim/colors
syntax on                   " Turn on syntax highlighting

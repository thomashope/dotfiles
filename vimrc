" THOMAS HOPE's .vimrc, constructed with help from the internet

set nocompatible            " Removes backwards compatability features for vi

set tabstop=4               " Tabs look like 4 spaces
set shiftwidth=4            " How to indent with '>' or autoindent
set expandtab               " Tabs are expanded to spaces as you type
set autoindent              " Use same indentation when starting a newline

set ruler                   " Display line/col in lower right corner
set number                  " Display line numbers down the left hand side
set relativenumber          " Display line numbers realtive to the cursor

set foldmethod=indent       " Fold code according to level of indetation
set nofoldenable            " No folds when you first open a file
" Use space to toggle folding
nnoremap <space> za

colorscheme spring-night    " ColorScheme from user rhysd on GitHub, place in ~/.vim/colors
syntax on                   " Turn on syntax highlighting

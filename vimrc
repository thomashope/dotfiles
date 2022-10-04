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

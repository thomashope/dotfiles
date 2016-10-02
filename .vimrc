" THOMAS HOPE
" Setup particularly for use with the 'Earthsong' terminal theme and with no
" GUI

set nocompatible    " Removes backwards compatability features for vi
filetype off
set nomodeline
" Avoid reaching up for the escape key
map § <Esc>
imap § <Esc>

" --- Search settings
set hlsearch        " highlight search results
set incsearch       " search incrementaly
set ignorecase      " case insensitive
set smartcase       " Except when explicitly using capitals
" Clearer search highlights
hi Search ctermfg=none ctermbg=none cterm=reverse
" keep the cursor centred when searching
nmap n nzz
" clears search results by pressing escape
nnoremap <esc> :noh<return>

" set ruler " AFAIK this is redundant when using ghettoline
set backspace=indent,eol,start
set autoindent
set laststatus=2    " Display the status line always
set confirm         " Ask for confirmation when doing scary things like :q
set number          " Displays line number at cursor
set relativenumber  " Display line numbers relative to the cursor
hi LineNr ctermbg=0 ctermfg=8
hi CursorLineNr ctermbg=0 ctermfg=8
 
" --- Indentation settings
set shiftwidth=4
set tabstop=4
set expandtab
set guifont=Monaco:h12

" --- Folding settings
setlocal foldmethod=syntax  " Folds based on rules from the syntax definiton
set nofoldenable            " no folding by default
hi Folded ctermbg=0 ctermfg=8
" Use space to toggle folding
nnoremap <space> za

" --- Bracket settings
hi MatchParen cterm=underline ctermbg=1 ctermfg=0 " Set bracket style

" --- Ghetto Powerline ---
" Statusline modifications, added Fugitive Status Line & Syntastic Error Message {{{2
let g:last_mode = ''
function! Mode()
  let l:mode = mode()

  if l:mode !=# g:last_mode
    let g:last_mode = l:mode

    hi User0 guifg=#ffffff  guibg=#094afe ctermbg=4 ctermfg=0
    hi User1 guifg=#ffdad8  guibg=#880c0e ctermbg=4 ctermfg=0
    hi User2 guifg=#000000  guibg=#F4905C ctermbg=4 ctermfg=0
    hi User3 guifg=#292b00  guibg=#f4f597 ctermbg=4 ctermfg=0
    hi User4 guifg=#112605  guibg=#aefe7B ctermbg=4 ctermfg=0
    hi User5 guifg=#051d00  guibg=#7dcc7d ctermbg=4 ctermfg=0
    hi User7 guifg=#ffffff  guibg=#880c0e ctermbg=4 ctermfg=0
    hi User8 guifg=#ffffff  guibg=#5b7fbb ctermbg=4 ctermfg=0
    hi User9 guifg=#ffffff  guibg=#810085 ctermbg=4 ctermfg=0

    " TODO: not working for some reason
    if l:mode ==# 'n'
        hi User0 ctermfg=0 ctermbg=15
    elseif l:mode ==# 'i'
        hi User0 ctermfg=1 ctermbg=14
    elseif l:mode ==# 'R'
        hi User0 ctermfg=2 ctermbg=13
    elseif l:mode ==# 'v' || l:mode ==# 'V' || l:mode ==# ''
        hi User0 ctermfg=3 ctermbg=12
    endif

    "if l:mode ==# 'n'
      "hi User0 guifg=#FFFFFF ctermfg=255
      "hi User1 guifg=#dfff00 ctermfg=190
    "elseif l:mode ==# 'i'
      "hi User0 guifg=#005fff guibg=#FFFFFF ctermfg=0 ctermbg=255
      "hi User1 guifg=#FFFFFF ctermfg=255
    "elseif l:mode ==# 'R'
      "hi User0 guifg=#FFFFFF guibg=#df0000 ctermfg=255 ctermbg=160
      "hi User1 guifg=#df0000 ctermfg=160
    "elseif l:mode ==? 'v' || l:mode ==# ''
      "hi User0 guifg=#4e4e4e guibg=#ffaf00 ctermfg=239 ctermbg=214
      "hi User1 guifg=#ffaf00 ctermfg=214
    "endif
  endif 

  if l:mode ==# 'n'
    return "   NORMAL  "
  elseif l:mode ==# 'i'
    return "   INSERT  "
  elseif l:mode ==# 'R'
    return "   REPLACE "
  elseif l:mode ==# 'v'
    return "   VISUAL  "
  elseif l:mode ==# 'V'
    return "   V·LINE  "
  elseif l:mode ==# ''
    return "   V·BLOCK "
  else
    return l:mode
  endif
endfunction

set statusline=%0*\%{Mode()}                         "mode
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %y\                                  "FileType
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%5*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%6*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%7*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%8*\ col:%03c\                            "Column number
set statusline+=%9*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" --- end of getto powerline

" remap control p to create markdown preview if extension is markdown
"TODO command is ':! pandoc % -o %:r.html'
map <C-p> :w<CR>:! pandoc % -o %:r.pdf<CR><CR>
imap <C-p> <ESC>:w<CR>:! pandoc % -o %:r.pdf<CR><CR>i

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugins
" NONE AT THE MOMENT

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
"set background=dark
"colorscheme solarized

" THOMAS HOPE

set nocompatible " removes backwards compatability features for vi
filetype off
set nomodeline

set hlsearch " highlight search results
set incsearch " search incrementaly
set ignorecase " case insensitive, except when using capitals
set smartcase
" clears search results by pressing escape
" nnoremap <esc> :noh<return><esc>

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
set guifont=Monaco:h12

  "Ghetto Powerline
" Statusline modifications, added Fugitive Status Line & Syntastic Error Message {{{2
let g:last_mode = ''
function! Mode()
  let l:mode = mode()

  if l:mode !=# g:last_mode
    let g:last_mode = l:mode

    hi User1 guifg=#ffdad8  guibg=#880c0e
    hi User2 guifg=#000000  guibg=#F4905C
    hi User3 guifg=#292b00  guibg=#f4f597
    hi User4 guifg=#112605  guibg=#aefe7B
    hi User5 guifg=#051d00  guibg=#7dcc7d
    hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
    hi User8 guifg=#ffffff  guibg=#5b7fbb
    hi User9 guifg=#ffffff  guibg=#810085
    hi User0 guifg=#ffffff  guibg=#094afe

    if l:mode ==# 'n'
      hi User3 guifg=#dfff00 ctermfg=190
    elseif l:mode ==# "i"
      hi User2 guifg=#005fff guibg=#FFFFFF ctermfg=27 ctermbg=255
      hi User3 guifg=#FFFFFF ctermfg=255
    elseif l:mode ==# "R"
      hi User2 guifg=#FFFFFF guibg=#df0000 ctermfg=255 ctermbg=160
      hi User3 guifg=#df0000 ctermfg=160
    elseif l:mode ==? "v" || l:mode ==# ""
      hi User2 guifg=#4e4e4e guibg=#ffaf00 ctermfg=239 ctermbg=214
      hi User3 guifg=#ffaf00 ctermfg=214
    endif
  endif 

  if l:mode ==# "n"
    return "  NORMAL "
  elseif l:mode ==# "i"
    return "  INSERT "
  elseif l:mode ==# "R"
    return "  REPLACE "
  elseif l:mode ==# "v"
    return "  VISUAL "
  elseif l:mode ==# "V"
    return "  V·LINE "
  elseif l:mode ==# ""
    return "  V·BLOCK "
  else
    return l:mode
  endif
endfunction

set statusline=%2*%{Mode()}%3*%1*                         "mode
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" end of getto powerline

" default configuration for You Complete Me
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" use control k to clang format
map <C-K> :pyf /usr/local/Cellar/clang-format/2015-04-21/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2015-04-21/share/clang/clang-format.py<cr>

" toggle nerd tree with control-n
"map <C-n> :NERDTreeToggle<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugins
"Plugin 'scrooloose/nerdtree'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
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
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

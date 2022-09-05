# setup dotfiles

link_file() { ln -fv $1 ~/.$1; }

link_file zshrc
link_file zshenv
link_file vimrc
link_file gitconfig
link_file gitconfig.local
link_file lldbinit
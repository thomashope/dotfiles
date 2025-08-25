#!/usr/bin/env bash
set -Eeuo pipefail

# setup dotfiles

link_file()
{
    TARGET="$HOME/.${1}"
    if [[ -e "$TARGET" ]]; then
        echo "Did not create link for '$1', since a file already exists"
    else
        ln -fv "$1" "$TARGET"
    fi
}

if [[ "$SHELL" == *bash ]]; then
    link_file bashrc
else
    link_file zshrc
    link_file zshenv
fi

link_file vimrc
link_file gitconfig
# link_file gitconfig.local
link_file lldbinit
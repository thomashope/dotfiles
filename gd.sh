#
# git diff
# TODO:
# - when a file has both staged and unstaged changes, make the diff preview display the correct changes for the one you have selected

#
# When FZF runs commands it does so in a subshell. Therefore you have to make any commands you want to call available
# in the subshell. Bash allows you to export functions with `export -f` however zsh does not. As a workaround this code
# is placed in it's own file and sourced by the fzf subshell before calling helper functions.
#

function gd() {
    
    export GD_SCRIPT_PATH="$HOME/.dotfiles/gd.sh"

    local ALL_FILES=$(_gd_list_all)

    if [[ -z "$ALL_FILES" ]]; then
        echo "No changed files."
        return
    fi

    echo "$ALL_FILES" | fzf \
        --header 'C-s stage, C-u unstage, C-r refresh, C-p toggle preview' \
        --bind 'ctrl-p:change-preview-window(90%|)' \
        --bind 'ctrl-r:reload(source "$GD_SCRIPT_PATH" && _gd_list_all)' \
        --bind 'ctrl-s:execute(git add {})+reload(source "$GD_SCRIPT_PATH" && _gd_list_all)' \
        --bind 'ctrl-u:execute(git unstage {})+reload(source "$GD_SCRIPT_PATH" && _gd_list_all)' \
        --preview 'source "$GD_SCRIPT_PATH" && _gd_preview_diff {}' \
        --ansi --keep-right
}

function _gd_list_files() {
    git "${@:2}" 2>/dev/null |
    while read -r line || [[ -n $line ]]; do
        if [ -n "$line" ]; then
            echo -e "\033[0;$1m$line\033[0m"
        fi
    done
}

function _gd_preview_diff() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        echo "File '$file' does not exist. Perhaps it was deleted?"
    elif ! git ls-files --error-unmatch "$file" &>/dev/null; then
        cat "$file"
    elif git diff --exit-code --quiet "$file"; then
        git diff --staged --color "$file"
    else
        git diff --color "$file"
    fi
}

function _gd_list_all() {
    _gd_list_files 31 diff --name-only
    _gd_list_files 32 diff --name-only --staged
    _gd_list_files 39 ls-files --others --exclude-standard
}
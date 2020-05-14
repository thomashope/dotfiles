alias ll="ls -lGp"
alias la="ls -laGp"
#alias vim="mvim -v"
alias love="/Applications/love.app/Contents/MacOS/love"
alias path='tr ":" "\n" <<< "$PATH"' # use single quotes so the var gets expanded when called rather than inline

# Simple custom prompt
#PS1="\[\e[0;32m\]\W \u \$ \[\e[m\]"
#export PS1
prompt='%F{green}%2~ %#%f '
export prompt

#PATH=$PATH:/Users/Cyphre/Library/Android/sdk/ndk-bundle
PATH=$PATH:~/scripts

# Put secret work stuff in a seperate file
source ~/.dotfiles/bashrc_work

export PATH

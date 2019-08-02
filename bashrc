alias ll="ls -lGp"
alias la="ls -laGp"
alias vim="mvim -v"
alias love="/Applications/love.app/Contents/MacOS/love"

# Simple custom prompt
PS1="\[\e[0;32m\]\W \u \$ \[\e[m\]"
export PS1

#PATH=$PATH:/Users/Cyphre/Library/Android/sdk/ndk-bundle
PATH=$PATH:~/scripts

# Put secret work stuff in a seperate file
source ./bashrc_work

export PATH

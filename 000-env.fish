set -x EDITOR emacsclient

# https://github.com/fisherman/rbenv#notes
set -x PATH "$HOME/.rbenv/bin" $PATH

set -x PATH "/usr/local/bin" $PATH
set -x PATH "$HOME/bin" $PATH

alias rm "rm -i"

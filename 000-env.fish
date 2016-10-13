set -x EDITOR emacsclient

set -x PATH "/usr/local/bin" $PATH
set -x PATH "$HOME/bin" $PATH

set -x PATH "$HOME/.rbenv/bin" $PATH
rbenv init - | source

alias rm "rm -i"

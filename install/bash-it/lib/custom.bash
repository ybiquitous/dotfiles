shopt -s autocd
shopt -s cdspell
shopt -s dotglob
shopt -s extglob
shopt -s globstar

if [[ -t 1 ]]; then
  bind '"\C-p":history-search-backward'
  bind '"\C-n":history-search-forward'
fi

export HISTFILE=~/.bash_history
export HISTSIZE=10000
export EDITOR=emacsclient
export PATH=~/bin:~/.yarn/bin:$PATH

if [[ -n $(command -v npm) ]]; then
  NODE_PATH=$(npm root -g)
  export NODE_PATH
fi

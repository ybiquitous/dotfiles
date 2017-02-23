#!/bin/bash
set -eu

BASEDIR=$(cd $(dirname $0);pwd)

function exists_command {
  command -v $1 >/dev/null 2>&1
}

# copy files to ~/
for file in $(find "$BASEDIR/HOME" -maxdepth 1 -type f | grep -v Xmodmap); do
  ln -svf "$file" "$HOME"
done

# Emacs
ln -svf "$BASEDIR/HOME/.emacs.d" "$HOME"
touch "$HOME/init-env.el"
[[ -s "$HOME/init-env.el" ]] && echo "(provide 'init-env)" > "$HOME/init-env.el"
ln -svf "$HOME/init-env.el" "$HOME/.emacs.d/inits"

# bin
export BIN_DIR="$HOME/bin"
mkdir -pv $BIN_DIR

# Apt
exists_command apt-get && (
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo add-apt-repository -y ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get -y dist-upgrade
  sudo apt-get -y install \
       apt-transport-https \
       autoconf \
       bison \
       build-essential \
       ca-certificates \
       curl \
       emacs24 \
       fish \
       git \
       libffi-dev \
       libgdbm-dev \
       libgdbm3 \
       libncurses5-dev \
       libreadline6-dev \
       libssl-dev \
       libyaml-dev \
       module-assistant \
       terminator \
       tree \
       xclip \
       zlib1g-dev
  sudo apt-get clean
  sudo apt-get autoremove
  sudo apt-get autoclean
)

# git diff-highlight
[[ ! -f $BIN_DIR/diff-highlight ]] && (
  cd $BIN_DIR
  curl -LO https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight
  chmod +x diff-highlight
)

# fish
if [[ $(echo $SHELL) != $(which fish) ]]; then
  chsh -s $(which fish)
  echo 'Changed login shell to "fish". Please login again.'
  exit
fi
export FISH_CONFIG="$HOME/.config/fish/conf.d/000-env.fish"
mkdir -p $(dirname "$FISH_CONFIG")
ln -svf "$BASEDIR/000-env.fish" "$FISH_CONFIG"
fish -c "source \"$FISH_CONFIG\""

# fisherman
export FISHER="$HOME/.config/fish/functions/fisher.fish"
[[ ! -e $FISHER ]] && (
  curl -Lo "$FISHER" --create-dirs git.io/fisher
  fish -c "fisher --version"
)
fish -c "fisher gitignore"

# heroku
curl -o- https://toolbelt.heroku.com/install.sh | sh
heroku --version

echo 'Installation completed. Please reopen shell.'

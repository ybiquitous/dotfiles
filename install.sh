#!/bin/bash
set -eu

function exists_command {
  command -v $1 >/dev/null 2>&1
}

# apt
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
       tree \
       zlib1g-dev
  sudo apt-get clean
  sudo apt-get autoremove
  sudo apt-get autoclean
)

# git diff-highlight
export BIN_DIR="$HOME/bin" && [[ ! -f $BIN_DIR/diff-highlight ]] && (
  mkdir -p $BIN_DIR
  cd $BIN_DIR
  curl -LO https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight
  chmod +x diff-highlight
)

if [[ $(echo $SHELL) != $(which fish) ]]; then
  chsh -s $(which fish)
  echo 'Changed login shell to "fish". Please login again.'
  exit
fi

# fisherman
export FISHER="$HOME/.config/fish/functions/fisher.fish"
[[ ! -e $FISHER ]] && (
  curl -Lo "$FISHER" --create-dirs git.io/fisher
  fish -c "fisher --version"
)

# nvm
export NVM_DIR="$HOME/.nvm" && [[ ! -d $NVM_DIR ]] && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" origin)
  fish -c "fisher nvm"
  fish -c "nvm --version"
  fish -c "nvm install 6"
  fish -c "npm install --progress=false -g editorconfig eslint git-open marked standard stylefmt stylelint tern"
)

# rbenv
export RBENV_DIR="$HOME/.rbenv" && [[ ! -d $RBENV_DIR ]] && (
  git clone https://github.com/rbenv/rbenv.git "$RBENV_DIR"
  cd "$RBENV_DIR"
  src/configure
  make -C src

  # ruby-build
  git clone https://github.com/rbenv/ruby-build.git "$RBENV_DIR/plugins/ruby-build"

  export FISH_CONFIG_FILE="$HOME/.config/fish/conf.d/000-env.fish"
  echo 'set -x PATH "$HOME/.rbenv/bin" $PATH' > "$FISH_CONFIG_FILE"
  fish -c "source \"$FISH_CONFIG_FILE\""
  fish -c "fisher rbenv"
  fish -c "rbenv --version"
  fish -c "rbenv install 2.3.1"
  fish -c "rbenv global 2.3.1"
)

# heroku
curl -o- https://toolbelt.heroku.com/install.sh | sh
heroku --version

echo 'Installation completed. Please reopen shell.'

#!/bin/sh
set -eu

readonly BASEDIR=$(cd "$(dirname "$0")"; pwd)/bash-it

create_symlinks() {
  cd "$BASEDIR"
  find . -type f | sed 's|./||' | xargs -I {} ln -svf "${BASEDIR}/{}" ~/.bash_it/{}
}

# https://github.com/Bash-it/bash-it#install
if [ ! -d ~/.bash_it ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  ~/.bash_it/install.sh
  create_symlinks
  cat <<'EOT'

Add next line to ~/.bashrc or ~/.bash_profile:

  export BASH_IT_THEME='mbriggs'

EOT

  exit
fi

# load bash-it
set +u
# shellcheck disable=SC1090
. ~/.bash_it/bash_it.sh
set -u

bash-it update

# plugin
bash-it disable plugin all
bash-it enable plugin \
        alias-completion \
        base \
        docker \
        git \
        hub \
        nvm \
        rbenv
if [ "$(uname -s)" = "Darwin" ]; then
  bash-it enable plugin osx
fi

# completion
bash-it disable completion all
bash-it enable completion \
        bash-it \
        brew \
        bundler \
        defaults \
        docker \
        gem \
        git \
        npm \
        nvm \
        system

# yarn-completion
git clone https://github.com/dsifford/yarn-completion.git ~/.yarn-completion
ln -svf ~/.yarn-completion/yarn-completion.bash ~/.bash_it/lib

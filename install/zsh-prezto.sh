#!/bin/zsh
set -eu

# https://github.com/sorin-ionescu/prezto#readme
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ZPREZTODIR="${ZDOTDIR:-$HOME}"/.zprezto

# https://github.com/belak/prezto-contrib#readme
git clone https://github.com/belak/prezto-contrib.git "${ZPREZTODIR}/contrib"
(cd "${ZPREZTODIR}/contrib" && git submodule init && git submodule update)

# https://github.com/lukechilds/zsh-nvm#readme
git clone https://github.com/lukechilds/zsh-nvm.git "${ZPREZTODIR}/modules/zsh-nvm"
(cd "${ZPREZTODIR}/modules/zsh-nvm" && \
   git submodule init && \
   git submodule update && \
   cat <<'EOF' >init.zsh)
export NVM_AUTO_USE=true
source "${0:h}/zsh-nvm.plugin.zsh"
EOF

# Configure
cat <<'EOF'
# Prezto configuraiton:

## ~/.zsh/.zpreztorc

```
zstyle ':prezto:load' pmodule \
  ...
  'history-substring-search' \
  'contrib-prompt' \
  'prompt' \
  'ruby' \
  'node' \
  'zsh-nvm'
```

EOF

cat <<'EOF' >>"${ZDOTDIR:-$HOME}/.zpreztorc"

# Custom theme
export SPACESHIP_CHAR_SUFFIX=' '
export SPACESHIP_CHAR_SYMBOL='$'
export SPACESHIP_DIR_TRUNC_REPO=false
zstyle ':prezto:module:prompt' theme 'spaceship'
EOF

cat <<'EOF' >>"${ZDOTDIR:-$HOME}/.zshrc"
eval "$(hub alias -s)"
eval "$(direnv hook zsh)"
export EDITOR=emacsclient
alias edit=$EDITOR
export PATH="${HOME}/bin:${PATH}"
EOF

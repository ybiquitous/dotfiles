export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:${PATH}"

# Homebrew - must run before compinit because shellenv sets PATH/FPATH etc.
if [[ -f '/opt/homebrew/bin/brew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# rbenv
if [[ -d "${HOME}/.rbenv" ]]; then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
  fpath=("${HOME}/.rbenv/completions" $fpath)
  eval "$(rbenv init - zsh)"
fi

# Completion cache directory
export ZSH_CACHE_DIR="${HOME}/.cache/zsh"
[[ -d "${ZSH_CACHE_DIR}/completions" ]] || mkdir -p "${ZSH_CACHE_DIR}/completions"
fpath=("${ZSH_CACHE_DIR}/completions" $fpath)

autoload -Uz compinit && compinit -u

# User configuration
export LANG=en_US.UTF-8
export VISUAL=emacsclient
export EDITOR="${VISUAL}"
export GPG_TTY="$(tty)"

# direnv
if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# fzf
if type fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# fnm (Fast Node Manager)
if type fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"

  if [[ ! -f "${HOMEBREW_PREFIX}/share/zsh/site-functions/_fnm" ]]; then
    eval "$(fnm completions --shell zsh)"
  fi
fi

# Starship
if type starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# GitHub CLI
if type gh &>/dev/null; then
  if [[ ! -f "${HOMEBREW_PREFIX}/share/zsh/site-functions/_gh" ]]; then
    eval "$(gh completion -s zsh)"
  fi
fi

# npm
if type npm &>/dev/null; then
  if [[ ! -f "${ZSH_CACHE_DIR}/completions/_npm" ]]; then
    npm completion > "${ZSH_CACHE_DIR}/completions/_npm"
  fi
  source "${ZSH_CACHE_DIR}/completions/_npm"
fi

# Podman
if type podman &>/dev/null; then
  if [[ ! -f "${HOMEBREW_PREFIX}/share/zsh/site-functions/_podman" ]]; then
    podman completion zsh --file "${ZSH_CACHE_DIR}/completions/_podman"
  fi
fi

# Git contrib
if [ -d "${HOMEBREW_PREFIX}/share/git-core/contrib" ]; then
  export PATH="${PATH}:${HOMEBREW_PREFIX}/share/git-core/contrib/git-jump"
fi

# curl
if [ -d "${HOMEBREW_PREFIX}/opt/curl" ]; then
  export PATH="${HOMEBREW_PREFIX}/opt/curl/bin:${PATH}"
fi

# Go
if [ -d "${HOME}/go" ]; then
  export PATH="${HOME}/go/bin:${PATH}"
fi

# Rust
if [ -f "${HOME}/.cargo/env" ]; then
  source "${HOME}/.cargo/env"
fi
# Add MANPATH for Rust. See https://github.com/rust-lang/rustup/issues/1729
if type rustup &>/dev/null; then
  export MANPATH="$(rustup show home)/toolchains/$(rustup default | grep -E '^\S+' --only-matching)/share/man:${MANPATH}"
fi

# Terraform
if type terraform &>/dev/null; then
  autoload -Uz bashcompinit && bashcompinit
  complete -o nospace -C "$(which terraform)" terraform
fi

# Atuin - shell history management
if type atuin &>/dev/null; then
  export ATUIN_NOBIND="true"
  eval "$(atuin init zsh)"
  bindkey -M emacs '^P' atuin-up-search
fi

# zsh-abbr
if [[ -f ~/.zsh/zsh-abbr/zsh-abbr.plugin.zsh ]]; then
  ABBR_SET_EXPANSION_CURSOR=1
  ABBR_LINE_CURSOR_MARKER='@'
  source ~/.zsh/zsh-abbr/zsh-abbr.plugin.zsh

  # TODO: Remove after fix, ref: https://github.com/olets/zsh-abbr/issues/210
  autoload -Uz _abbr
  compdef _abbr abbr
fi

# zsh-autosuggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fi

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

if [[ -f ~/.zshrc.env ]]; then
  source ~/.zshrc.env
fi

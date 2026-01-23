# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [ -f '/opt/homebrew/bin/brew' ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
UNBUNDLED_COMMANDS=(irb)
zstyle ':omz:plugins:nvm' autoload no
zstyle ':omz:plugins:nvm' silent-autoload yes
export FORGIT_NO_ALIASES=true
if [ -f "${HOME}/.cargo/env" ]; then source "${HOME}/.cargo/env"; fi
plugins=(
  brew
  bundler
  direnv
  fzf
  gh
  history
  history-substring-search
  jenv
  npm
  nvm
  rbenv
  rust
  starship
  web-search

  # custom
  zsh-autosuggestions
  zsh-completions
)
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

source $ZSH/oh-my-zsh.sh


# TODO: Remove this after merging https://github.com/ohmyzsh/ohmyzsh/pull/12891
if type rbenv &>/dev/null; then
  fpath+=("$(rbenv root)/completions")
  compinit
fi

# User configuration
compinit # re-enable completions from plugins

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom
export VISUAL=emacsclient
export EDITOR=$VISUAL
export GPG_TTY=$(tty)

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

# Add MANPATH for Rust. See https://github.com/rust-lang/rustup/issues/1729
if type rustup &>/dev/null; then
  export MANPATH="$(rustup show home)/toolchains/$(rustup default | grep -E '^\S+' --only-matching)/share/man:${MANPATH}"
fi

# Terraform
if type terraform &>/dev/null; then
  complete -o nospace -C "$(which terraform)" terraform
fi

# Atuin
if type atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

if [[ -f ~/.zshrc.env ]]; then
  source ~/.zshrc.env
fi

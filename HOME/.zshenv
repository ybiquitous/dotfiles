export ZDOTDIR=${HOME}/.zsh

[ -f ${HOME}/.exports ] && source ${HOME}/.exports
[ -f ${HOME}/.exports.mine ] && source ${HOME}/.exports.mine

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

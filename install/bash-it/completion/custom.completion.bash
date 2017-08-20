# Simple workaround for Heroku completion (see https://github.com/heroku/cli/issues/224)
_heroku_completions() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(compgen -W "help $(heroku help | tail -n +4 | awk '{ print $1 }')" -- "$cur"))
}
complete -F _heroku_completions heroku

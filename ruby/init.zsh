#
# Ruby initialization
#

# rbenv support (https://github.com/rbenv/rbenv)
if [[ -d "${HOME}/.rbenv" ]]; then
  # Add rbenv to the path
  if (( ! $+commands[rbenv] )); then
    export PATH="${HOME}/.rbenv/bin:${PATH}"
  fi

  # Initialize rbenv (prepends ~/.rbenv/shims to path)
  eval "$(rbenv init - --no-rehash)"
fi

# Source module files
source "${0:h}/aliases.zsh"

#!/usr/bin/env zsh

# gem helper
gem_install_or_update () {
  if gem list "$1" --installed > /dev/null; then
    echo "Updating %s ..." "$1"
    gem update "$@"
  else
    echo "Installing %s ..." "$1"
    gem install "$@"
    rbenv rehash
  fi
}

alias gem_uninstall_all="gem uninstall -aIx"

# aliases
alias be="bundle exec"
alias rspec="bundle exec rspec"
alias rake="bundle exec rake"
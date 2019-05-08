#!/usr/bin/env ruby
#
# Homebrew Bundle file
# - https://github.com/Homebrew/homebrew-bundle
#

# Taps
tap 'homebrew/cask'
tap 'homebrew/cask-versions'
tap 'homebrew/cask-fonts'
tap 'homebrew/services' # https://github.com/Homebrew/homebrew-services

# Brews
brew 'autoconf'
brew 'automake'
brew 'bash'
brew 'coreutils'
brew 'curl'
brew 'fasd'
brew 'gcc'
brew 'gettext', link: true
brew 'git'
brew 'git-open'
brew 'gpg'
brew 'imagemagick'
brew 'lesspipe'
brew 'libtool'
brew 'libxml2'
brew 'libxslt'
brew 'libyaml'
brew 'neovim'
brew 'openssl'
brew 'openvpn'
brew 'pandoc'
brew 'pkg-config'
brew 'readline'
brew 'tmux'
brew 'tree'
brew 'yarn', args: ['without-node']
brew 'zsh'

# homebrew cask
# cask 'dash'
# cask 'docker'
# cask 'hammerspoon'
# cask 'iterm2'
# cask 'the-unarchiver'
# cask 'visual-studio-code'

# caskroom/fonts
# cask 'homebrew/cask-fonts/font-fira-code'

# Local Brewfile
local_brewfile = File.expand_path('~/.Brewfile.local')
instance_eval File.read(local_brewfile) if File.exists?(local_brewfile)
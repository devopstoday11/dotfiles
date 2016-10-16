#!/usr/bin/env zsh

# Bootstrap
source $DOTFILES/init.zsh
dotfiles_require 'brew'

# Setup permissions
sudo chown -R "$USER":admin /usr/local

# -------------------------------------------
# Install homebrew

if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
    curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
    # append_to_zshrc '# recommended by brew doctor'
    # append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1
    export PATH="/usr/local/bin:$PATH"
else
  echo "Homebrew already installed. Skipping ..."
fi

echo "Updating Homebrew formulas ..."
brew update
brew upgrade

echo "Install Homebrew Services ..."
brew tap homebrew/services

echo "Install Caskroom ..."
brew_install_or_upgrade caskroom/cask/brew-cask
brew_tap caskroom/versions

echo "Install Caskroom Repair ..."
brew install vitorgalvao/tiny-scripts/cask-repair

# -------------------------------------------
# Install common brews

brew_install_or_upgrade 'curl'
brew_install_or_upgrade 'git'
brew_install_or_upgrade 'git-extras'
brew_install_or_upgrade 'ctags'
brew_install_or_upgrade 'imagemagick'
brew_install_or_upgrade 'qt'
brew_install_or_upgrade 'vim'

# -------------------------------------------
# Install dev brews

brew_cask_install_or_upgrade 'java'

brew_install_or_upgrade 'mysql'
brew_launchctl_restart 'mysql'

brew_install_or_upgrade 'node'
brew_install_or_upgrade 'nvm'

brew_install_or_upgrade 'postgres'
brew_launchctl_restart 'postgres'

brew_install_or_upgrade 'python'
brew_install_or_upgrade 'python3'
pip install virtualenv

brew_install_or_upgrade 'redis'
brew_launchctl_restart 'redis'

brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'

# -------------------------------------------
# Install dev tools

brew_install_or_upgrade 'ansible'
brew_install_or_upgrade 'awscli'

brew_cask_install_or_upgrade 'atom'
brew_cask_install_or_upgrade 'beyond-compare'
brew_cask_install_or_upgrade 'dash'
brew_cask_install_or_upgrade 'virtualbox'
brew_cask_install_or_upgrade 'visual-studio-code'

# brew_cask_install_or_upgrade 'browserstacklocal'
# brew_cask_install_or_upgrade 'github'
# brew_cask_install_or_upgrade 'vagrant'

brew_cask_install_or_upgrade 'sequel-pro'
brew_cask_install_or_upgrade 'pgadmin'
brew_cask_install_or_upgrade 'postico'

# -------------------------------------------
# Install macOS brews

brew_cask_install_or_upgrade 'cheatsheet'
brew_cask_install_or_upgrade 'flash'
brew_cask_install_or_upgrade 'firefoxdeveloperedition'
brew_cask_install_or_upgrade 'electrum'
brew_cask_install_or_upgrade 'keepassx'
brew_cask_install_or_upgrade 'google-chrome'
brew_cask_install_or_upgrade 'licecap'
brew_cask_install_or_upgrade 'logitech-myharmony'
brew_cask_install_or_upgrade 'omnigraffle'
brew_cask_install_or_upgrade 'skype'
brew_cask_install_or_upgrade 'slack'
brew_cask_install_or_upgrade 'slate'
brew_cask_install_or_upgrade 'spotify'
brew_cask_install_or_upgrade 'steam'
brew_cask_install_or_upgrade 'the-unarchiver'
brew_cask_install_or_upgrade 'tunnelblick'
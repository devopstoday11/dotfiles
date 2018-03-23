#
# Zplug plugins
#

# zplug "zplug/zplug", hook-build:'zplug --self-manage'

# zsh-user plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

# docker completions
zplug "docker/cli", use:contrib/completion/zsh
zplug "docker/compose", use:contrib/completion/zsh

# z plugin
zplug "plugins/z", from:oh-my-zsh

# local zsh setup
zplug "${DOTFILES_DIR}/zsh", from:local, use:"init.zsh": defer:2

# local modules
zplug "${DOTFILES_DIR}/asdf", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/asdf", from:local, as:command, use:"bin/*", lazy:on
zplug "${DOTFILES_DIR}/brew", from:local
zplug "${DOTFILES_DIR}/docker", from:local
zplug "${DOTFILES_DIR}/dotenv", from:local
zplug "${DOTFILES_DIR}/elm", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/functions", from:local, use:"*", lazy:on
zplug "${DOTFILES_DIR}/git", from:local
zplug "${DOTFILES_DIR}/macos", from:local
zplug "${DOTFILES_DIR}/node", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/python", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/ruby", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/rust", from:local, use:"init.zsh"
zplug "${DOTFILES_DIR}/ssh", from:local

# zsh theme (async for zsh used by pure)
zplug "mafredri/zsh-async", from:github, defer:0
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme, defer:3

# Load any local packages
if [[ -f "${ZPLUG_LOCAL_LOADFILE}" ]]; then
  source "${ZPLUG_LOCAL_LOADFILE}"
fi

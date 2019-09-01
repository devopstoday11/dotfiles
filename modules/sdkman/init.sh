#
# Initialize sdkman module
#
# - https://sdkman.io/
#

# skip the rest if sdkman is not installed
if [[ ! -d "${HOME}/.sdkman" ]]; then
  return
fi

# globabl registry of commands that trigger sdkman init
SDK_LAZY_TRIGGERS=()

sdk_candidate_enabled() {
  candidate=${1}
  [[ -s "$SDKMAN_DIR/candidates/$candidate/current" ]]
}

sdk_lazy_init_cmd() {
  triggers=($@)
  for cmd in "${triggers[@]}"; do
    SDK_LAZY_TRIGGERS+=($cmd)
    eval "${cmd}() { _sdk_init; ${cmd} \$@; }"
  done
}

_sdk_init() {
  # cleanup
  unset -f $0
  unset -f sdk_lazy_init_cmd
  unset -f ${SDK_LAZY_TRIGGERS[@]}
  unset SDK_LAZY_TRIGGERS

  # expensive operation
  source "${SDKMAN_DIR}/bin/sdkman-init.sh"
}

_sdk_lazy_init() {
  sdk_lazy_init_cmd "sdk"
  unset -f $0
}

# initialize sdkman if installed (lazy)
if [[ -d "${HOME}/.sdkman" ]]; then
  export SDKMAN_DIR="${HOME}/.sdkman"
  _sdk_lazy_init
fi

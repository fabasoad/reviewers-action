#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

tool_installed() {
  if which "${1}" >/dev/null 2>&1; then
    log_info "${1} is found at $(which "${1}")"
    echo "true"
  else
    log_info "${1} is not installed"
    echo "false"
  fi
}

main() {
  # shellcheck disable=SC2129
  echo "node=$(tool_installed "node")" >> "$GITHUB_OUTPUT"
  echo "npm=$(tool_installed "npm")" >> "$GITHUB_OUTPUT"
  echo "codeowners=$(tool_installed "codeowners")" >> "$GITHUB_OUTPUT"
  echo "curl=$(tool_installed "curl")" >> "$GITHUB_OUTPUT"
  echo "gh=$(tool_installed "gh")" >> "$GITHUB_OUTPUT"
}

main "$@"

#!/usr/bin/env sh

log_info() {
  printf "[info] [reviewers-action] %s %s\n" "$(date +'%Y-%m-%d %T')" "${1}" >&2
}

tool_installed() {
  if which "${1}" >/dev/null 2>&1; then
    log_info "${1} is found at $(which "${1}")"
    echo "true"
  else
    log_info "${1} is not installed"
    echo "false"
  fi
}

# shellcheck disable=SC2129
echo "node=$(tool_installed "node")" >> "$GITHUB_OUTPUT"
echo "npm=$(tool_installed "npm")" >> "$GITHUB_OUTPUT"
echo "codeowners=$(tool_installed "codeowners")" >> "$GITHUB_OUTPUT"
echo "curl=$(tool_installed "curl")" >> "$GITHUB_OUTPUT"
echo "gh=$(tool_installed "gh")" >> "$GITHUB_OUTPUT"

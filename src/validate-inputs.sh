#!/usr/bin/env sh

# Validates value to be a non-empty string.
# Parameters:
# 1. (Required) Param name to display it correctly in the error message for the
#    users.
# 2. (Required) Param value that will be validated.
check_is_not_empty() {
  if [ -z "${2}" ]; then
    echo "::error title=Invalid parameter::\"${1}\" parameter is empty."
    exit 1
  fi
}

main() {
  input_github_token="${1}"
  input_pr_number="${2}"
  input_reviewers_filename="${3}"

  check_is_not_empty "github-token" "${input_github_token}"
  check_is_not_empty "pr-number" "${input_pr_number}"
  check_is_not_empty "reviewers-filename" "${input_reviewers_filename}"
}

main "$@"

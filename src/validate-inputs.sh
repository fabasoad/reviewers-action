#!/usr/bin/env sh

input_github_token="$1"
input_pr_number="$2"
input_reviewers_filename="$3"

check_if_not_empty() {
  if [ -z "$2" ]; then
    echo "::error title=Invalid parameters::\"$1\" parameter is empty"
    exit 1
  fi
}

check_if_not_empty "github-token" "${input_github_token}"
check_if_not_empty "pr-number" "${input_pr_number}"
check_if_not_empty "reviewers-filename" "${input_reviewers_filename}"

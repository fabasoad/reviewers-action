#!/usr/bin/env sh

main() {
  github_api_url="${1}"
  github_repository="${2}"
  github_token="${3}"
  pr_number="${4}"
  reviewers_json="${5}"

  curl -sSL \
    -o /dev/null \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${github_token}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "${github_api_url}/repos/${github_repository}/pulls/${pr_number}/requested_reviewers" \
    -d "${reviewers_json}"
}

main "$@"

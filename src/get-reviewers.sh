#!/usr/bin/env bash

reviewers_filename="$1"
changed_files_list="$2"

build_reviewers_str() {
  local -n data_ref=$1
  n=0
  reviewers_str=""
  for github_slug in "${!data_ref[@]}"
  do
    n=$((n + 1))
    if [ $n -gt 1 ]; then
      reviewers_str="${reviewers_str},"
    fi
    if [[ $github_slug == "@"* ]]; then
      github_slug="${github_slug:1}"
    fi
    reviewers_str="${reviewers_str}\"${github_slug}\""
  done
  echo "${reviewers_str}"
}

# Prepare hash maps with the reviewers list. Both IC and team handles.
declare -A reviewers_ic_map
declare -A reviewers_team_map
base_list=$(codeowners audit -c "${reviewers_filename}")
for changed_file in ${changed_files_list}; do
  n=0
  for github_slug in $(echo "${base_list}" | grep "${changed_file}")
  do
    n=$((n + 1))
    if [ $n -lt 2 ]; then
      continue
    fi
    if [[ $github_slug == *"/"* ]]; then
      # shellcheck disable=SC2034
      reviewers_team_map[$github_slug]=1
    else
      # shellcheck disable=SC2034
      reviewers_ic_map[$github_slug]=1
    fi
  done
done

# Comma-separated list with IC reviewers
reviewers_ic_str=$(build_reviewers_str reviewers_ic_map)
# Comma-separated list with team reviewers
reviewers_team_str=$(build_reviewers_str reviewers_team_map)

json="{\"reviewers\":[${reviewers_ic_str}],\"team_reviewers\":[${reviewers_team_str}]}"
echo "json=${json}" >> "$GITHUB_OUTPUT"

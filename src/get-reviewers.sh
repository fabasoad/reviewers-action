#!/usr/bin/env bash

reviewers_filename="$1"
changed_files_list="$2"
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
      reviewers_team_map[$github_slug]=1
    else
      reviewers_ic_map[$github_slug]=1
    fi
  done
done
# Comma-separated list with IC reviewers
n=0
reviewers_ic_str=""
for i in "${!reviewers_ic_map[@]}"
do
  n=$((n + 1))
  if [ $n -gt 1 ]; then
    reviewers_ic_str="${reviewers_ic_str},"
  fi
  reviewers_ic_str="${reviewers_ic_str}\"${i}\""
done
# Comma-separated list with team reviewers
n=0
reviewers_team_str=""
for i in "${!reviewers_team_map[@]}"
do
  n=$((n + 1))
  if [ $n -gt 1 ]; then
    reviewers_team_str="${reviewers_team_str},"
  fi
  reviewers_team_str="${reviewers_team_str}\"${i}\""
done
json="{\"reviewers\":[${reviewers_ic_str}],\"teamReviewers\":[${reviewers_team_str}]}"
echo "json=${json}" >> "$GITHUB_OUTPUT"

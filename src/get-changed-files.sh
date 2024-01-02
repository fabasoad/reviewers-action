#!/usr/bin/env sh

adjust_branch_name() {
  original_name="$1"
  prefix="origin/"

  case "${original_name}" in
    "${prefix}"*) echo "${original_name}";;
    *) echo "${prefix}${original_name}";;
  esac
}

base_ref="$(adjust_branch_name "$1")"
head_ref="$(adjust_branch_name "$2")"

changed_files=$(git diff --name-only "${base_ref}" "${head_ref}")
echo "all=${changed_files}" >> "$GITHUB_OUTPUT"

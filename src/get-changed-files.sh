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

changed_files_list=$(git diff --name-only "${base_ref}" "${head_ref}")

changed_files_str=""
n=0
for changed_file in ${changed_files_list}; do
  n=$((n + 1))
  if [ $n -gt 1 ]; then
    changed_files_str="${changed_files_str} "
  fi
  changed_files_str="${changed_files_str}${changed_file}"
done
echo "all=${changed_files_str}" >> "$GITHUB_OUTPUT"

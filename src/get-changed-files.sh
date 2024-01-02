#!/usr/bin/env sh

base_ref="$1"
head_ref="$2"

changed_files=$(git diff --name-only "${base_ref}" "${head_ref}")
echo "all=${changed_files}" >> "$GITHUB_OUTPUT"

#!/usr/bin/env bash

node_installed="false"
if command -v node &> /dev/null; then
  node_installed="true"
fi
npm_installed="false"
if command -v npm &> /dev/null; then
  npm_installed="true"
fi
codeowners_installed="false"
if command -v codeowners &> /dev/null; then
  codeowners_installed="true"
fi
curl_installed="false"
if command -v curl &> /dev/null; then
  curl_installed="true"
fi
gh_installed="false"
if command -v gh &> /dev/null; then
  gh_installed="true"
fi
# shellcheck disable=SC2129
echo "node=${node_installed}" >> "$GITHUB_OUTPUT"
echo "npm=${npm_installed}" >> "$GITHUB_OUTPUT"
echo "codeowners=${codeowners_installed}" >> "$GITHUB_OUTPUT"
echo "curl=${curl_installed}" >> "$GITHUB_OUTPUT"
echo "gh=${gh_installed}" >> "$GITHUB_OUTPUT"

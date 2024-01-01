# Reviewers action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/reviewers-action?include_prereleases)
![linting](https://github.com/fabasoad/reviewers-action/actions/workflows/linting.yml/badge.svg)

This GitHub action to parse a CODEOWNERS like files and use it to set reviewers
on PRs.

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:
`bash`.

## Permissions

None

## Inputs

```yaml
with:
  # (Optional) Auth token with permissions to assign reviewers to a PR. Defaults
  # to ${{ github.token }}.
  github-token: "${{ secrets.GITHUB_TOKEN }}"
  # (Optional) CODEOWNERS like filename. Defaults to "REVIEWERS".
  reviewers-filename: "REVIEWERS"
```

## Outputs

None.

# Reviewers action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/reviewers-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/reviewers-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/reviewers-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/reviewers-action/actions/workflows/linting.yml/badge.svg)

This GitHub action parses a CODEOWNERS like file and use it to set reviewers on
pull requests.

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:

- [bash](https://www.gnu.org/software/bash/)
- [git](https://git-scm.com/)

## Inputs

```yaml
with:
  # (Optional) Auth token with permissions to assign reviewers to a PR. Defaults
  # to ${{ github.token }}.
  github-token: "${{ secrets.GITHUB_TOKEN }}"
  # (Optional) PR number to assign reviewers to. Defaults to ${{ github.event.pull_request.number }},
  # i.e. it defaults to the current PR if trigger is "pull_request".
  pr-number: "25"
  # (Optional) CODEOWNERS like filename. Defaults to "REVIEWERS".
  reviewers-filename: "REVIEWERS"
```

## Outputs

None.

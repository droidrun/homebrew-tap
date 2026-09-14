# `droidrun/homebrew-tap`

Homebrew tap for Droidrun's open-source CLIs.

## Install

```bash
brew install droidrun/tap/mobilerun-ios
```

The first run auto-registers the tap; subsequent `brew upgrade mobilerun-ios` works with the short name.

Equivalent two-step form:

```bash
brew tap droidrun/tap
brew install mobilerun-ios
```

## Formulae

| Formula | Upstream |
|---|---|
| [`mobilerun-ios`](Formula/mobilerun-ios.rb) | [droidrun/mobilerun-ios](https://github.com/droidrun/mobilerun-ios) |

## Updating formulae

Binaries and SHA256SUMS are hosted in the public
[droidrun/mobilerun-ios-releases](https://github.com/droidrun/mobilerun-ios-releases/releases)
repository. Publishing a stable upstream release requests a formula-update PR.
A maintainer reviews the version, URLs and checksums and merges the PR before the
update becomes available through this tap.

To request the same reviewed update manually:

```bash
gh workflow run update-mobilerun-ios.yml --repo droidrun/homebrew-tap -f tag=v0.2.0
```

`AUTOMATION_PR_TOKEN` must have Contents and Pull requests read/write access to
this repository. The organization policy blocking PR creation with the default
`GITHUB_TOKEN` remains in place. The automation never approves or merges its own
proposals.

For local development, use a feature branch, run
`scripts/bump-mobilerun-ios.sh <tag>` and `python3 -m unittest discover -s tests`,
then open a PR. Do not push formula updates directly to `main`.

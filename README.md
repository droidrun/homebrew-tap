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

Binaries are hosted on R2 at `https://media.mobilerun.ai/releases/<formula>/<tag>/`. Releases in the upstream repos bump their formula here automatically by running `scripts/bump-mobilerun-ios.sh <tag>` and pushing the result.

Manual bump (if automation is down):

```bash
./scripts/bump-mobilerun-ios.sh v0.2.0
git add Formula/mobilerun-ios.rb && git commit -m "mobilerun-ios v0.2.0" && git push
```

# gahingwoo/tap

Homebrew casks for [RKDevelopTool GUI](https://github.com/gahingwoo/RKDevelopTool-GUI),
[Roxora Imager](https://github.com/roxora-os/imager) and
[Maskrom Studio](https://github.com/gahingwoo/maskrom-studio).

```sh
brew trust gahingwoo/tap
brew install --cask gahingwoo/tap/rkdeveloptool-gui
brew install --cask gahingwoo/tap/roxora-imager
brew install --cask gahingwoo/tap/maskrom-studio@nightly
```

Homebrew only loads casks from third-party taps you have trusted, hence
the first line.

The rkdeveloptool-gui cask installs the latest release. After that the app updates itself
(bottom-right corner, "Check for updates"), so `brew upgrade` isn't needed.

Roxora Imager does not update itself: `brew upgrade --cask roxora-imager`
installs a new version once this tap has it.

## Maskrom Studio

One cask per release tier; install one of them, they conflict with each other.

| Cask | Tier | What it installs |
|---|---|---|
| `maskrom-studio` | Stable | the newest release (a vX.Y.Z tag); added with the first release |
| `maskrom-studio@beta` | Prerelease | the newest pre-release (vX.Y.Z-beta.N); added with the first one |
| `maskrom-studio@nightly` | CI | the rolling `ci` release: the latest successful build of main, untested |

The stable and beta casks are pull requests opened by Maskrom Studio's
release workflow when a tag is published. The nightly cask points at
version-less files that every build of main replaces, so it is version
`:latest`: `brew upgrade --cask --greedy maskrom-studio@nightly` fetches the
current build.

Maskrom Studio also updates itself, following the tier chosen in its
Settings (Maskrom Studio updates: Stable, Prerelease or CI); a copy
installed from this tap is updated by running Homebrew with the cask
that installed it.

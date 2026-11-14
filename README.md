# gahingwoo/tap

Homebrew casks for [RKDevelopTool GUI](https://github.com/gahingwoo/RKDevelopTool-GUI)
and [Roxora Imager](https://github.com/roxora-os/imager).

```sh
brew trust gahingwoo/tap
brew install --cask gahingwoo/tap/rkdeveloptool-gui
brew install --cask gahingwoo/tap/roxora-imager
```

Homebrew only loads casks from third-party taps you have trusted, hence
the first line.

The rkdeveloptool-gui cask installs the latest release. After that the app updates itself
(bottom-right corner, "Check for updates"), so `brew upgrade` isn't needed.

Roxora Imager does not update itself: `brew upgrade --cask roxora-imager`
installs a new version once this tap has it.

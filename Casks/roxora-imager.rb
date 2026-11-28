cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "5ed2436509855c91aaa5e2d656ee299d91b81b722311e83fbb135da6aa8095b8",
         intel: "27cccec73fc15c14f654ec96d9814c1cbc041671a29bbafc273729041838d11e"

  url "https://github.com/roxora-os/imager/releases/download/v#{version}/roxora-imager-#{version}-macos-#{arch}.dmg"
  name "Roxora Imager"
  desc "Download, check and write Roxora images for Rockchip boards"
  homepage "https://roxora-os.github.io/roxora-imager/"

  # Written by roxora-os/imager's scripts/bump-cask.mjs. Betas are GitHub
  # pre-releases, which livecheck skips.
  livecheck do
    url :url
    strategy :github_releases
  end

  conflicts_with cask: "roxora-imager@nightly"
  depends_on :macos

  app "Roxora Imager.app"

  # The app isn't notarized yet; without this the first launch is blocked.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Roxora Imager.app"]
  end

  zap trash: [
    "~/Library/Application Support/Roxora Imager",
    "~/Library/Preferences/io.github.roxora-os.imager.plist",
    "~/Library/Saved Application State/io.github.roxora-os.imager.savedState",
  ]
end

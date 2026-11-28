cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "f73dae89eaa9487f65f369e4db8201d01a527e8d741597a1100b7a354a11c5a1",
         intel: "036c935fb9d0baa831dc3c49b9da11304fdaff79347b70969fe3978e49e443f1"

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

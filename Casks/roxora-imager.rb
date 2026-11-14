cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "64d306ec66e66eb04f6a3a25a384b2f61fae8c63eb1e91943caa6ca74c6cfcac",
         intel: "988c673eec061b39e811fc2bdf3936ccd97dd00554290e9abb45f010fa9e29c3"

  url "https://github.com/roxora-os/imager/releases/download/v#{version}/roxora-imager-#{version}-macos-#{arch}.dmg"
  name "Roxora Imager"
  desc "Download, check and write Roxora images for Rockchip boards"
  homepage "https://roxora-os.github.io/roxora-imager/"

  # Releases are pre-releases until they have been tested on hardware.
  livecheck do
    url :url
    strategy :github_releases
  end

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

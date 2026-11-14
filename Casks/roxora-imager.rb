cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "70e2f0c13a6a38f03274e3fad337d77da0b14d55b25547d8be74d63838f2fced",
         intel: "85c8d5aa017c489b60e1aa338b73cf974bc418841ea3a6a9d66c27110056d9b1"

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

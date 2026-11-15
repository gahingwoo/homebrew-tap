cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.8"
  sha256 arm:   "9ce9f48ce475a954b2046b4ea03ee3cfb8ebf4b27c393324173a8aa084136300",
         intel: "1bbabed8a88a38b99905f8115c478cebd7142005e9ff38a37dc65d3e6297b812"

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

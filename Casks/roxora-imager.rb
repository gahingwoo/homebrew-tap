cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "e98a523f5a21f879f22201a5e0b46bfa662bb92bc7e851099044200850c7b580",
         intel: "1593445f056bf71b8104849addf189b202f4b0b4c2ef73536228ba98673ebb64"

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

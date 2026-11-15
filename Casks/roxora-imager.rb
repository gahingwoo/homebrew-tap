cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.7"
  sha256 arm:   "ad5a28dae9c414bd637bc7f84628b6d64046b186188447e9db629f9f24183b11",
         intel: "4b4b6220c12202712bcf6315bbaf3970b9f62906ec96db4e012be1fd1c911718"

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

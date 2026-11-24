cask "maskrom-studio@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 :no_check

  # The rolling "ci" release: the latest successful build of main, untested.
  url "https://github.com/gahingwoo/maskrom-studio/releases/download/ci/maskrom-studio-macos-#{arch}.dmg"
  name "Maskrom Studio"
  desc "Install and restore systems and UEFI firmware on Rockchip boards"
  homepage "https://github.com/gahingwoo/maskrom-studio"

  livecheck do
    skip "Rolling build of main, replaced on every successful build"
  end

  conflicts_with cask: ["maskrom-studio", "maskrom-studio@beta"]
  depends_on :macos

  app "Maskrom Studio.app"

  # The app isn't notarized yet; without this the first launch is blocked.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Maskrom Studio.app"]
  end

  zap trash: [
    "~/Library/Application Support/Maskrom Studio",
    "~/Library/Preferences/com.gahingwoo.MaskromStudio.plist",
    "~/Library/Saved Application State/com.gahingwoo.MaskromStudio.savedState",
  ]
end

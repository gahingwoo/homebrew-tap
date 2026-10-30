cask "rkdeveloptool-gui" do
  arch arm: "arm64", intel: "x86_64"

  # The DMG names carry no version, so this always installs the latest
  # release; the app updates itself after that.
  version :latest
  sha256 :no_check

  url "https://github.com/gahingwoo/RKDevelopTool-GUI/releases/latest/download/RKDevelopTool-GUI-#{arch}.dmg"
  name "RKDevelopTool GUI"
  desc "Flash Rockchip boards with rkdeveloptool"
  homepage "https://github.com/gahingwoo/RKDevelopTool-GUI"

  depends_on :macos

  app "RKDevelopTool-GUI.app"

  # The app isn't notarized yet; without this the first launch is blocked.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RKDevelopTool-GUI.app"]
  end

  zap trash: [
    "~/Library/Caches/RKDevelopTool-GUI",
    "~/Library/Preferences/com.gahingwoo.RKDevelopTool-GUI.plist",
  ]
end

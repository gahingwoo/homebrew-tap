cask "roxora-imager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.10"
  sha256 arm:   "1ac1269fb886f74a4933ffb712015d8bf73d9bc906c136e908897dd15b417d36",
         intel: "676a12b105249d2424394b27cbb533579f42c319fa65fe5ea7f005817555088b"

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

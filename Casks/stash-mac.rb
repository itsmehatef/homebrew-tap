cask "stash-mac" do
  version "0.1.0"
  sha256 "6e2ce2c62851505069b3888122970139a7f872e30bafacc1ae4bc87725f9f7ba"

  url "https://github.com/itsmehatef/stash-mac/releases/download/v#{version}/Stash-#{version}.zip",
      verified: "github.com/itsmehatef/stash-mac/"
  name "Stash"
  desc "Tiny menu-bar clipboard history app"
  homepage "https://github.com/itsmehatef/stash-mac"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Stash.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Stash.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Stash",
    "~/Library/Preferences/com.hatefkasraei.Stash.plist",
    "~/Library/Caches/com.hatefkasraei.Stash",
    "~/Library/HTTPStorages/com.hatefkasraei.Stash",
    "~/Library/Saved Application State/com.hatefkasraei.Stash.savedState",
  ]
end

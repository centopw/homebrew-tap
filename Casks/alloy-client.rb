# Homebrew cask for Alloy. Rendered by scripts/bump-cask.sh into
# centopw/homebrew-tap/Casks/alloy-client.rb; the release workflow does this after every stable release.
# Change this template and the script, never the copy in the tap by hand.
cask "alloy-client" do
  version "0.5.0"
  sha256 arm:   "6b427321e1fd1e233e6868eaabfc04bb728dbf39a65228f2c2ec2fde4c5b7e17",
         intel: "a290ca6c68c24393009f73799512f0e82495b46eaa50b5125081aea2f8dc7e7e"

  on_arm do
    url "https://github.com/centopw/alloy/releases/download/v#{version}/Alloy_#{version}_aarch64.dmg"
  end
  on_intel do
    url "https://github.com/centopw/alloy/releases/download/v#{version}/Alloy_#{version}_x64.dmg"
  end

  name "Alloy"
  desc "Client for personal Telegram and Facebook Messenger accounts"
  homepage "https://github.com/centopw/alloy"

  # The cask is bumped by the release workflow; the app then installs its own updates (Tauri updater).
  livecheck do
    skip "Updated by scripts/bump-cask.sh in the release workflow"
  end

  auto_updates true
  depends_on :macos

  app "Alloy.app"

  zap trash: [
    "~/Library/Application Support/vn.hce.alloy",
    "~/Library/Caches/vn.hce.alloy",
    "~/Library/Logs/vn.hce.alloy",
    "~/Library/Preferences/vn.hce.alloy.plist",
    "~/Library/Saved Application State/vn.hce.alloy.savedState",
    "~/Library/WebKit/vn.hce.alloy",
  ]

  caveats <<~EOS
    Alloy is signed with a stable self-signed certificate but is not notarized, so the first launch
    needs one extra step: right-click Alloy in Applications and choose Open, or allow it under
    System Settings > Privacy & Security > Open Anyway.

    Homebrew only loads casks from trusted taps: if it refuses this one, run
      brew trust --cask centopw/tap/alloy-client
  EOS
end

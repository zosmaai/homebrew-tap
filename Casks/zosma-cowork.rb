cask "zosma-cowork" do
  version "0.15.0"
  sha256 "a5819b7e547e8422e3bdb65d9732241126a74f7b3c6035a0f2e5debb7cfbf90e"

  url "https://github.com/zosmaai/zosma-cowork/releases/download/v0.15.0/zosma-cowork_#{version}_universal.dmg",
      verified: "github.com/zosmaai/zosma-cowork/"
  name "zosma-cowork"
  desc "Desktop AI coworker built on the pi coding agent — streaming, thinking, tool calls"
  homepage "https://github.com/zosmaai/zosma-cowork"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "zosma-cowork.app"

  uninstall quit: "ai.zosma.cowork"

  zap trash: [
    "~/Library/Application Support/ai.zosma.cowork",
    "~/Library/Caches/ai.zosma.cowork",
    "~/Library/HTTPStorage/ai.zosma.cowork",
    "~/Library/Preferences/ai.zosma.cowork.plist",
    "~/Library/Saved Application State/ai.zosma.cowork.savedState",
    "~/.zosmaai/cowork",
  ]
end

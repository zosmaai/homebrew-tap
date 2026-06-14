cask "zosma-cowork" do
  version "0.16.3"
  sha256 "c61029211a9380c8d35545b1b16472d50001ee30bfaf3003c8ece226d4b2e125"

  url "https://github.com/zosmaai/zosma-cowork/releases/download/v0.16.3/zosma-cowork_#{version}_universal.dmg",
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

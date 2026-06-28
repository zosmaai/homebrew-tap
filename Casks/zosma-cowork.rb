cask "zosma-cowork" do
  version "0.16.6"
  sha256 "095e057688ce2faa30254490c4760655e1dc0f8403561e44ffebc71baca6e614"

  url "https://github.com/zosmaai/zosma-cowork/releases/download/v0.16.6/zosma-cowork_#{version}_universal.dmg",
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

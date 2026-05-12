cask "zosma-cowork" do
  version "0.7.0"
  sha256 arm:   "e67b7a7264d40477d7d59ba13236987ae64d41b50bc541e802159df2bbfd6cdf",
         intel: "73c2b51aa15d73b217b02a48d6aa2faaef4b113bba8fe3ae9d1431249357e414"

  url "https://github.com/zosmaai/zosma-cowork/releases/download/v#{version}/zosma-cowork_#{version}_aarch64.dmg",
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

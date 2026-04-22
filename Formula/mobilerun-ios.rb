class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.1/mobilerun-ios-v0.1.1-darwin-arm64"
      sha256 "042941cf233c5a575165395b35d2dc4ea5b90f419ef4cebcc9d3742f4788241b"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.1/mobilerun-ios-v0.1.1-darwin-amd64"
      sha256 "6e2ef53f08453b789cc68e2f3f821d9c35b8ddd433ef27c3c9484439eeae1d58"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.1/mobilerun-ios-v0.1.1-linux-arm64"
      sha256 "ae49ed097c1be48a49562ba889c72e8c9f6cd74a9aab0127da02b7171819cd9e"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.1/mobilerun-ios-v0.1.1-linux-amd64"
      sha256 "92fe2f8ffa024a8ff25969421072bd7222a9b6dc1966535d218f2872d0dcfbd9"
    end
  end

  def install
    binary = Dir["mobilerun-ios-v*"].first
    odie "no mobilerun-ios binary found in staging dir" if binary.nil?
    bin.install binary => "mobilerun-ios"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobilerun-ios --version")
  end
end

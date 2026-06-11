class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.0/mobilerun-ios-v0.2.0-darwin-arm64"
      sha256 "e8de529b2ab27cfd24bc2c17515e31c8e5a2a5df753974ded45a01b06b3de98e"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.0/mobilerun-ios-v0.2.0-darwin-amd64"
      sha256 "516f7b9332c8fc5981d8ce95c03f823c1b78f58197f47b5c34ec6611ad6f458e"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.0/mobilerun-ios-v0.2.0-linux-arm64"
      sha256 "93c41ba1b05c7ba947104511c094b33acce89e7ae4c456335201c32350a5e89c"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.0/mobilerun-ios-v0.2.0-linux-amd64"
      sha256 "091e7054052586f0eb9d8994a3c788706f1a6f9f96811a787c0b1f3ec2b10281"
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

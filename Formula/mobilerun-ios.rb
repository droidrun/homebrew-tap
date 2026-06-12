class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.1/mobilerun-ios-v0.2.1-darwin-arm64"
      sha256 "c8844d72386faee9d97c8b6e4ce10806712650b908b353f987143b7d9f3208f2"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.1/mobilerun-ios-v0.2.1-darwin-amd64"
      sha256 "da320253bbb1e7e0f24b514e1ee1099eb0f43c8549e970dbe798bf6e126fa55d"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.1/mobilerun-ios-v0.2.1-linux-arm64"
      sha256 "6f92a143f6fa20b1b91dc841eace15ced5f7280399d8c9d3c74340446010f047"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.2.1/mobilerun-ios-v0.2.1-linux-amd64"
      sha256 "61d44d9bce13642860f6931dc3fb916d6aa507922a8a845a8925bc75c3980881"
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

class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.3.0/mobilerun-ios-v0.3.0-darwin-arm64"
      sha256 "2db09d40e5964a56be0cbd45a19be2391a832242a628c941c521198d1fd21c2c"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.3.0/mobilerun-ios-v0.3.0-darwin-amd64"
      sha256 "56bd799c58ef6f11b9984d53e2a2f83343713941112f0a1e44114c5cbbf36718"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.3.0/mobilerun-ios-v0.3.0-linux-arm64"
      sha256 "6f4b38f6a989f228a99ecc057fec06f8fe9153b760216b26ba70324a310fffcc"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.3.0/mobilerun-ios-v0.3.0-linux-amd64"
      sha256 "45b57aa6e9475b0c24c42005f4d1d1bdc27ae788df7538a6686e61ebababd9a7"
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

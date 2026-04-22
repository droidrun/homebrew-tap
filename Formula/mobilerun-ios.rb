class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.2/mobilerun-ios-v0.1.2-darwin-arm64"
      sha256 "69e4258e98f7f82e9369236c8741541a15875f65f957d3a7fb2de6014e7a7042"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.2/mobilerun-ios-v0.1.2-darwin-amd64"
      sha256 "cc9562b0c6bc6f821947d9a44b5cfcfb98178b41dfa58564448b20e80172a9c0"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.2/mobilerun-ios-v0.1.2-linux-arm64"
      sha256 "ca5a6ff356b56e79bc76c33624ccb57a06f904ee04b6af941d62512d059b24a2"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.2/mobilerun-ios-v0.1.2-linux-amd64"
      sha256 "ed6ccde9c4e0a116abf156419dd80aaae144c432f45e7fdf9683c2433dd705b9"
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

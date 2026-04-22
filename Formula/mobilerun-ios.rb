class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.0/mobilerun-ios-v0.1.0-darwin-arm64"
      sha256 "4526070227f6090ef44cfed9abdaca1dbeeaa580ba1ae8081c2e5c6b5a12dc86"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.0/mobilerun-ios-v0.1.0-darwin-amd64"
      sha256 "78626a601d5bb0b92fc5a449475879947b3558dc55516d925ed8587da6dd1a19"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.0/mobilerun-ios-v0.1.0-linux-arm64"
      sha256 "288605aaf442b412d5ddf81890c717ef05dfa5730232b501c8293859c50b0244"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.0/mobilerun-ios-v0.1.0-linux-amd64"
      sha256 "1da6566f8ae57f5fc00dbefe7b6973cae118d77ce1d8e80a584c6e52c90adf95"
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

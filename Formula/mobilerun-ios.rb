class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.3/mobilerun-ios-v0.1.3-darwin-arm64"
      sha256 "4f49068919501a347349f49d52cc411613090132679aa372ee095dcd9c765f57"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.3/mobilerun-ios-v0.1.3-darwin-amd64"
      sha256 "c83ef647ac8a953e872845926ebdb15ac38e4ac67dabe668a7f47ca7c0a4a554"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.3/mobilerun-ios-v0.1.3-linux-arm64"
      sha256 "6e56e358ccf6a34695bd14a0522f97106dcc62ad5e2d7d1aeb7e9be7ef51efc1"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.3/mobilerun-ios-v0.1.3-linux-amd64"
      sha256 "7d4124c16a5f3467f44647b03dd533fd03f832e0401c6a9e042698e1f2cbf297"
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

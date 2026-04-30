class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.4/mobilerun-ios-v0.1.4-darwin-arm64"
      sha256 "e0bbbbc24b04353f738d232d21842550a960bb45c6ff82428870080b95758bcf"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.4/mobilerun-ios-v0.1.4-darwin-amd64"
      sha256 "e9721cbb00a9297e17159068f78af23a2e3e63b43f3198378ea6a2e17757626a"
    end
  end

  on_linux do
    on_arm do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.4/mobilerun-ios-v0.1.4-linux-arm64"
      sha256 "01959be5794f1d5cc98b3b89abf7879fcb74304777c35024c975ece6b63871a7"
    end
    on_intel do
      url "https://media.mobilerun.ai/releases/mobilerun-ios/v0.1.4/mobilerun-ios-v0.1.4-linux-amd64"
      sha256 "425f0259fdea12f69a3d60a4a2f7dcb6e384cb32b9aa3aad3123b689725be75b"
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

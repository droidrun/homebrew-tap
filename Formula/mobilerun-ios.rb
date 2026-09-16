class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.4.1"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.1/mobilerun-ios-v0.4.1-darwin-arm64"
      sha256 "6717b6c480f6ffc18ebfb569432f57b2a1aec2f67aebf0fc6bd611f4df96c5cf"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.1/mobilerun-ios-v0.4.1-darwin-amd64"
      sha256 "5b5e99adc4c534e157171a3a18b21b4ef401016d4218e607d9558b07d597ca6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.1/mobilerun-ios-v0.4.1-linux-arm64"
      sha256 "987e9cbb6a521c53070573d9b37d9df7aabc884cb99e4ac35b2870f61ff917f9"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.1/mobilerun-ios-v0.4.1-linux-amd64"
      sha256 "f9ca724dc6c4830b02d283a4a690082d36f1667ddee6ebed1b9ef813cced4a11"
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

class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.4.0"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.0/mobilerun-ios-v0.4.0-darwin-arm64"
      sha256 "ae4cf23aff46bb333ec07275e8fea12dd305e96f57c0cc930d28ba802920a6c1"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.0/mobilerun-ios-v0.4.0-darwin-amd64"
      sha256 "0ae4138772379783123b3515cf4340cb67223128669bd2dd72d55727cc4f83e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.0/mobilerun-ios-v0.4.0-linux-arm64"
      sha256 "49090b597adc5f65e4d48c06a62c8a9c501f50fdb12ca5ca31001f99f416a48e"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.0/mobilerun-ios-v0.4.0-linux-amd64"
      sha256 "0efa0e4030d9a59ee79c2ce432f8e7d8581166f99a4aae44ed042876da50880d"
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

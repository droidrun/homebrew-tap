class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.6.0"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.6.0/mobilerun-ios-v0.6.0-darwin-arm64"
      sha256 "42460567e660144dd75a154200b3500a911124e81c6ebd86ea68935f87c2db55"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.6.0/mobilerun-ios-v0.6.0-darwin-amd64"
      sha256 "fd1285113445e8aa3b5c103ff1578ae95f5b05ab6630f243e9099827249c2c85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.6.0/mobilerun-ios-v0.6.0-linux-arm64"
      sha256 "ec8491fe05baf998633085c3632f8b91d134b79512e0f8a6fd3859fd678e5709"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.6.0/mobilerun-ios-v0.6.0-linux-amd64"
      sha256 "8df508fd70cf7e7053a369abadf54cc6f12b2da2735784f83372b477ea378b40"
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

class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.5.0"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.5.0/mobilerun-ios-v0.5.0-darwin-arm64"
      sha256 "96e405f022f51df1ce88c2e0ad42ae291b083aabb5f652efee2d5597b9196e72"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.5.0/mobilerun-ios-v0.5.0-darwin-amd64"
      sha256 "eb3ae2bf9767f924d6f75cacc8777f3ea7342993cb098abbac5874d43a72acf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.5.0/mobilerun-ios-v0.5.0-linux-arm64"
      sha256 "8e6b59176a880fa851e86a07e8124b6f23a4fc5017baf8b46ad080babe28f627"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.5.0/mobilerun-ios-v0.5.0-linux-amd64"
      sha256 "2f660a8f11afbb3470a2a036df62e513ff57c1420fb05f06bbc891413a9dc782"
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

class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.7.1"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.7.1/mobilerun-ios-v0.7.1-darwin-arm64"
      sha256 "60e3008bd4b14eee119558d0f4ece77c5b4e05eb0f465713b6db0a35cc66b0a8"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.7.1/mobilerun-ios-v0.7.1-darwin-amd64"
      sha256 "35f1ddaefd5a426337f373148e5e4761f902d41c7bbfca0da98b3a5e5a43ee36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.7.1/mobilerun-ios-v0.7.1-linux-arm64"
      sha256 "89b6cf00973a1e8a6d447d6e44bd9409bdd7ba0f405e284a4d0827fa245afdeb"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.7.1/mobilerun-ios-v0.7.1-linux-amd64"
      sha256 "00393dcae95643a1c8edf8f2b282a2df327f88ac89278b81a6c5992f16dc94c3"
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

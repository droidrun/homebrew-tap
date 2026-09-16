class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.4.2"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.2/mobilerun-ios-v0.4.2-darwin-arm64"
      sha256 "d05b184631f9b675c19a6e47715cb4f5f112139f97d49bdfd7334864c03dee8d"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.2/mobilerun-ios-v0.4.2-darwin-amd64"
      sha256 "d658cdec28ecc1bee93dcc919a1edc824d7832a25b665a02de6ae0d9d6832d5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.2/mobilerun-ios-v0.4.2-linux-arm64"
      sha256 "ce6637e44ec428b63f952ec5e8785d07a6a031f6f99fe4e5f3e1f34644ceb937"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.2/mobilerun-ios-v0.4.2-linux-amd64"
      sha256 "71c6468bddf9e8cebcf911456ecfada1b99a290b0a36f47ce99a05471283c334"
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

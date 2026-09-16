class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "0.4.3"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under `opt/ffmpeg@8` when `ffmpeg` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.3/mobilerun-ios-v0.4.3-darwin-arm64"
      sha256 "d1d86dd8b8b0cdaa50240810c0e148f84e570a78961a87491ff61ea20ef6fe44"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.3/mobilerun-ios-v0.4.3-darwin-amd64"
      sha256 "321d86d7669a2930668b060d26a953163f72a334c1d55c874883a79c9fef34c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.3/mobilerun-ios-v0.4.3-linux-arm64"
      sha256 "c67e929bfec9a963a5a35f079965e1788e619eef7815e30592e707d27efe9185"
    end
    on_intel do
      url "https://github.com/droidrun/mobilerun-ios-releases/releases/download/v0.4.3/mobilerun-ios-v0.4.3-linux-amd64"
      sha256 "07c21456a3b5f3486cf07365652094234645a9f3bc97bfcce355a6fc18e746a0"
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

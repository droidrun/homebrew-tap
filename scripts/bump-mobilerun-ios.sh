#!/usr/bin/env bash
# Regenerate Formula/mobilerun-ios.rb for the given release tag.
#
# Usage: ./scripts/bump-mobilerun-ios.sh v0.2.0
#
# Reads SHA256SUMS from the public GitHub release and writes a fresh formula.

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "usage: $0 <tag>  (e.g. v0.2.0)" >&2
    exit 1
fi

tag="$1"
if [[ ! "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "error: tag must be a stable version such as v0.2.0" >&2
    exit 1
fi
version="${tag#v}"

base="https://github.com/droidrun/mobilerun-ios-releases/releases/download/${tag}"
sums="$(curl -fsSL "${base}/SHA256SUMS")"

sha_for() {
    echo "$sums" | awk -v b="mobilerun-ios-${tag}-$1" '
        $2 == b { value = tolower($1); count++ }
        END { if (count != 1) exit 1; print value }
    '
}

darwin_arm="$(sha_for darwin-arm64)"
darwin_amd="$(sha_for darwin-amd64)"
linux_arm="$(sha_for linux-arm64)"
linux_amd="$(sha_for linux-amd64)"

for val in "$darwin_arm" "$darwin_amd" "$linux_arm" "$linux_amd"; do
    if [[ ! "$val" =~ ^[a-f0-9]{64}$ ]]; then
        echo "error: invalid SHA256 entry in ${base}/SHA256SUMS" >&2
        exit 1
    fi
done

formula="$(dirname "$0")/../Formula/mobilerun-ios.rb"

cat > "$formula" <<EOF
class MobilerunIos < Formula
  desc "Bridge a local iPhone to the Mobilerun cloud over a single websocket"
  homepage "https://github.com/droidrun/mobilerun-ios-releases"
  version "${version}"

  # Portal recording and the browser-compat H.264 transcoder spawn ffmpeg; the
  # release is validated against FFmpeg 8. ffmpeg@8 is keg-only, and the binary
  # looks for it under \`opt/ffmpeg@8\` when \`ffmpeg\` is not on PATH.
  depends_on "ffmpeg@8"

  on_macos do
    on_arm do
      url "${base}/mobilerun-ios-${tag}-darwin-arm64"
      sha256 "${darwin_arm}"
    end
    on_intel do
      url "${base}/mobilerun-ios-${tag}-darwin-amd64"
      sha256 "${darwin_amd}"
    end
  end

  on_linux do
    on_arm do
      url "${base}/mobilerun-ios-${tag}-linux-arm64"
      sha256 "${linux_arm}"
    end
    on_intel do
      url "${base}/mobilerun-ios-${tag}-linux-amd64"
      sha256 "${linux_amd}"
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
EOF

echo "wrote $formula for ${tag}"

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[1] / 'scripts/bump-mobilerun-ios.sh'
PLATFORMS = ['darwin-arm64', 'darwin-amd64', 'linux-arm64', 'linux-amd64']


class FormulaTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        for directory in ['scripts', 'Formula', 'bin']:
            (self.root / directory).mkdir()
        shutil.copyfile(SOURCE, self.root / 'scripts/bump.sh')
        self.sums = self.root / 'checksums'
        self.sums.write_text(''.join(f'{str(i + 1) * 64}  mobilerun-ios-v1.2.3-{platform}\n' for i, platform in enumerate(PLATFORMS)))
        curl = self.root / 'bin/curl'
        curl.write_text('#!/bin/sh\ncat "$CHECKSUM_FILE"\n')
        curl.chmod(0o755)
        self.env = dict(os.environ, PATH=str(self.root / 'bin') + os.pathsep + os.environ['PATH'], CHECKSUM_FILE=str(self.sums))

    def run_bump(self, tag='v1.2.3'):
        return subprocess.run(['bash', str(self.root / 'scripts/bump.sh'), tag], env=self.env, text=True, capture_output=True)

    def test_generates_all_platforms_from_the_release_checksums(self):
        result = self.run_bump()
        self.assertEqual(result.returncode, 0, result.stderr)
        formula = self.root / 'Formula/mobilerun-ios.rb'
        text = formula.read_text()
        self.assertIn('version "1.2.3"', text)
        self.assertEqual(text.count('sha256 "'), 4)
        for platform in PLATFORMS:
            self.assertIn('mobilerun-ios-v1.2.3-' + platform, text)
        if shutil.which('ruby'):
            subprocess.run(['ruby', '-c', str(formula)], check=True, capture_output=True)

    def test_missing_checksum_does_not_write_a_formula(self):
        self.sums.write_text(self.sums.read_text().splitlines()[0] + '\n')
        self.assertNotEqual(self.run_bump().returncode, 0)
        self.assertFalse((self.root / 'Formula/mobilerun-ios.rb').exists())

    def test_duplicate_checksum_does_not_write_a_formula(self):
        self.sums.write_text(self.sums.read_text() + self.sums.read_text().splitlines()[0] + '\n')
        self.assertNotEqual(self.run_bump().returncode, 0)
        self.assertFalse((self.root / 'Formula/mobilerun-ios.rb').exists())

    def test_invalid_checksum_is_rejected(self):
        self.sums.write_text(self.sums.read_text().replace('1' * 64, 'not-a-sha'))
        self.assertNotEqual(self.run_bump().returncode, 0)

    def test_non_version_tags_are_rejected(self):
        for tag in ['v1.2.3";system("bad")', 'main', 'v1.2.3/../../other', 'v1.2.3-rc1']:
            self.assertNotEqual(self.run_bump(tag).returncode, 0)
        self.assertFalse((self.root / 'Formula/mobilerun-ios.rb').exists())


if __name__ == '__main__':
    unittest.main()

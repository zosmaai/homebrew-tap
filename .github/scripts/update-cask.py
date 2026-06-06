#!/usr/bin/env python3
"""Update the cask formula with a new version, DMG names, and SHA256s.

Usage:
  python3 .github/scripts/update-cask.py <cask-file> <version> <arm-dmg> <intel-dmg> <arm-sha256> <intel-sha256> [release-tag]

Args are strings — use empty string '' for missing values.

<release-tag> is the exact GitHub release tag (e.g. "v0.14.0" or "0.15.0").
It is written verbatim into the download URL path so the cask works whether or
not the tag carries a leading "v". Defaults to "v<version>" for backwards
compatibility.
"""
import os
import re
import sys


def main():
    cask_file = sys.argv[1]
    version = sys.argv[2]
    arm_dmg = sys.argv[3]
    intel_dmg = sys.argv[4]
    sha256_arm = sys.argv[5]
    sha256_intel = sys.argv[6]
    tag = sys.argv[7] if len(sys.argv) > 7 and sys.argv[7] else f"v{version}"

    with open(cask_file) as f:
        content = f.read()

    # Update version
    content = re.sub(
        r'^  version ".*"',
        f'  version "{version}"',
        content,
        count=1,
        flags=re.MULTILINE,
    )

    # Build URL template from the primary DMG name. The release tag is written
    # verbatim into the path segment (NOT assumed to be "v#{version}"), so this
    # works for both "v0.14.0" and bare "0.15.0" style tags.
    primary_dmg = arm_dmg or intel_dmg
    url_filename = primary_dmg.replace(version, "#{version}")
    content = re.sub(
        r'(/releases/download/)[^/"]+/[^")\s]+',
        rf'\g<1>{tag}/{url_filename}',
        content,
        count=1,
    )

    # Update SHA256
    if sha256_arm and sha256_intel:
        content = re.sub(
            r'  sha256 arm:.*',
            f'  sha256 arm:   "{sha256_arm}",',
            content,
        )
        content = re.sub(
            r'         intel:.*',
            f'         intel: "{sha256_intel}"',
            content,
        )
    elif sha256_arm:
        # ARM-only / universal — rewrite to flat sha256
        # Handle both dual-arch (arm:) and single-arch (flat) formats
        content = re.sub(r'^         intel:.*\n?', "", content, flags=re.MULTILINE)
        result, n = re.subn(r'  sha256 arm:.*', f'  sha256 "{sha256_arm}"', content)
        if n == 0:
            # Already flat format — update the existing flat sha256
            content = re.sub(r'  sha256 ".*"', f'  sha256 "{sha256_arm}"', content)
        else:
            content = result

    with open(cask_file, "w") as f:
        f.write(content)

    print(f"Updated Cask to version {version}")
    for line in content.split("\n"):
        if any(x in line for x in ["version", "sha256", "url "]):
            print(f"  {line.strip()}")


if __name__ == "__main__":
    main()

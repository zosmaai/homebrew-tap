# Homebrew Tap for Zosma Cowork

[![Update Cask](https://github.com/zosmaai/homebrew-tap/actions/workflows/update-cask.yml/badge.svg)](https://github.com/zosmaai/homebrew-tap/actions/workflows/update-cask.yml)

Official [Homebrew](https://brew.sh) Cask tap for [Zosma Cowork](https://github.com/zosmaai/zosma-cowork) — an open-source desktop AI coworker.

## Installation

```bash
# Add the tap
brew tap zosmaai/tap

# Install Zosma Cowork
brew install --cask zosma-cowork
```

> **Note:** If you see "zosma-cowork is not signed" from macOS Gatekeeper, use `--no-quarantine`:
> ```bash
> brew install --cask --no-quarantine zosma-cowork
> ```
> The `--no-quarantine` flag prevents macOS from blocking the app. Zosma Cowork is open-source but not yet signed with an Apple Developer certificate. [Code signing is planned](https://github.com/zosmaai/zosma-cowork/issues).

## Updating

```bash
brew update
brew upgrade --cask zosma-cowork
```

## Uninstalling

```bash
brew uninstall --cask zosma-cowork
brew untap zosmaai/tap
```

## How It Works

This tap is automatically updated when a new [Zosma Cowork release](https://github.com/zosmaai/zosma-cowork/releases) is published. The CI workflow:

1. Receives a `repository_dispatch` from the zosma-cowork release pipeline
2. Downloads the macOS DMG for the new version
3. Computes the SHA256 checksum
4. Updates the Cask formula with the new version and checksum
5. Commits and pushes the update

## Cask Details

- **Identifier:** `zosma-cowork`
- **Bundle ID:** `ai.zosma.cowork`
- **Architectures:** ARM64 (Apple Silicon), x86_64 (Intel)
- **Minimum macOS:** 10.15 (Catalina)

## License

MIT © [Zosma AI](https://zosma.ai)

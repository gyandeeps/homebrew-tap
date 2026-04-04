# Homebrew Tap for Verve CLI

Official Homebrew tap for the [Verve Shadow CLI](https://github.com/gyandeeps/verve-releases) — a workstation telemetry agent for cognitive load analysis.

## Installation

```bash
brew install gyandeeps/tap/verve-cli
```

## Usage

```bash
# Run the CLI
verve-cli

# Run as a background service (auto-start on boot)
brew services start verve-cli

# Stop the background service
brew services stop verve-cli

# Check version
verve-cli --version
```

## Upgrading

```bash
brew upgrade verve-cli
```

## How It Works

This tap is **automatically updated** by the Verve CI/CD pipeline. When a new release is published, the formula's version, download URLs, and SHA256 checksums are updated via a `repository_dispatch` event from the main repository.

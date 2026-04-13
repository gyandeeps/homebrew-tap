class VerveCli < Formula
  desc "Shadow CLI for Verve — workstation telemetry agent for cognitive load analysis"
  homepage "https://github.com/gyandeeps/verve-releases"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/gyandeeps/verve-releases/releases/download/0.0.1/verve-cli-darwin-arm64.tar.gz"
    sha256 "b80cac97b2d27d598adf0beaa1be2934d46275357c6907c0e4b915bb4b5a40db" # arm64
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/gyandeeps/verve-releases/releases/download/0.0.1/verve-cli-darwin-amd64.tar.gz"
    sha256 "7b6898293a3a365bef28e8391ee22c8f323a53e6c967c56e03699fb95696e834" # amd64
  end

  def install
    binary_name = Dir["verve-cli-darwin-*"].first
    bin.install binary_name => "verve-cli"
  end

  test do
    assert_match "verve-cli", shell_output("#{bin}/verve-cli --version 2>&1", 0)
  end

  service do
    run [opt_bin/"verve-cli"]
    keep_alive true
    log_path var/"log/verve-cli.log"
    error_log_path var/"log/verve-cli-error.log"
  end
end

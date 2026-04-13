class VerveCli < Formula
  desc "Shadow CLI for Verve — workstation telemetry agent for cognitive load analysis"
  homepage "https://github.com/gyandeeps/verve-releases"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/gyandeeps/verve-releases/releases/download/0.0.1/verve-cli-darwin-arm64.tar.gz"
    sha256 "0292d5757bc075aa80375a82fb801931a7482bfb697e49f52e226e27b16e4ab4" # arm64
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/gyandeeps/verve-releases/releases/download/0.0.1/verve-cli-darwin-amd64.tar.gz"
    sha256 "5e19ee10415b469f1b0d33d2a14d15c5e9708bc52c9b7dd6792203ab47daab04" # amd64
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

# frozen_string_literal: true

class VeraUnison < Formula
  desc "VeraCrypt container create, mount, sync, and unmount scripts"
  homepage "https://github.com/dugal/homebrew-tap"
  url "https://github.com/dugal/vera_unison/releases/download/v2.1.0/vera-unison-v2.1.0.tar.gz"
  sha256 "41faf9f9f5f561162e4f91b4aadc6bd89f15260da9e0815ec7a627df19d41161"
  license "MIT"

  depends_on "unison"
  # veracrypt is a cask: brew install --cask veracrypt

  def install
    # `vera` dispatcher + vera-* compatibility shims on PATH;
    # the six inlined implementation scripts live in libexec/ and are exec'd
    # by the dispatcher (bin/../libexec resolution).
    bin.install "vera"
    bin.install Dir["vera-*"]
    libexec.install Dir["libexec/*"]
    doc.install "CHANGELOG.md"
  end

  test do
    system "#{bin}/vera", "--version"
    system "#{bin}/vera-create", "--version"
    system "#{bin}/vera-selftest", "--version"
  end
end

# frozen_string_literal: true

class SetupGitRemote < Formula
  desc "Wire local git repos to a Gitea remote on a NAS"
  homepage "https://github.com/dugal/homebrew-tap"
  url "https://github.com/dugal/nas-tools/releases/download/v0.5.6/nas-tools-v0.5.6.tar.gz"
  sha256 "07052d1385f04af5c5f8b142172564683e97ae1aa558a70bc85db88d69d3a678"
  license "MIT"

  def install
    libexec.install "lib/common.sh"
    ["bin/setup-git-remote.sh", "bin/sync-to-nas.sh"].each do |script|
      inreplace script,
        'source "${SCRIPT_DIR}/../lib/common.sh"',
        "source \"#{libexec}/common.sh\""
    end
    bin.install "bin/setup-git-remote.sh" => "setup-git-remote.sh"
    bin.install "bin/sync-to-nas.sh" => "sync-to-nas.sh"
    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    system "#{bin}/setup-git-remote.sh", "--version"
    system "#{bin}/sync-to-nas.sh", "--version"
  end
end

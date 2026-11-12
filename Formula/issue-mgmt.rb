# frozen_string_literal: true

class IssueMgmt < Formula
  desc "File-based issue tracking CLI and Claude Code skill bundle"
  homepage "https://github.com/dougtech/homebrew-tap"
  url "https://github.com/dugal/issue-mgmt/releases/download/v3.4.1/issue-mgmt-v3.4.1.tar.gz"
  sha256 "0af620a348322e9c70d5a109e730d2528b7d2f4b8f1fdd5185638fd7a1d91219"
  version "3.4.1"
  license "MIT"

  depends_on "python3"

  def install
    bin.install "issue"
    # Python helper modules imported by the bin scripts via
    # Path(__file__).resolve().parent.parent / "lib" -- installing the
    # directory at <prefix>/lib keeps that resolution working post-install.
    prefix.install "lib"
    (share/"issue-mgmt").install "ISSUE-TEMPLATE.md"
    (share/"issue-mgmt").install "CHEATSHEET.md"
    (share/"issue-mgmt").install "store-template"
    (share/"issue-mgmt").install "skills"
    doc.install "LICENSE"
    doc.install "CHANGELOG.md"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Claude Code skills were installed to:
        #{share}/issue-mgmt/skills/

      To install them into Claude Code, run:
        issue admin install-skills

      This copies each skill to ~/.claude/skills/<name>/SKILL.md and makes
      the /issue-* slash commands available in Claude Code sessions.
    EOS
  end

  test do
    system "#{bin}/issue", "--version"
    system "#{bin}/issue", "--help"
  end
end

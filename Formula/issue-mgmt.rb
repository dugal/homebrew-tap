# frozen_string_literal: true

class IssueMgmt < Formula
  desc "File-based issue tracking CLI and Claude Code skill bundle"
  homepage "https://github.com/dougtech/homebrew-tap"
  url "https://github.com/dugal/issue-mgmt/releases/download/v3.3.1/issue-mgmt-v3.3.1.tar.gz"
  sha256 "f0264a0c99f4f1dc4671c43f9e47d955b0f013610e0f33ce19b3e656f7a206b8"
  version "3.3.1"
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
    (share/"issue-mgmt/skills").install "skills/issue-activity.md"
    (share/"issue-mgmt/skills").install "skills/issue-block.md"
    (share/"issue-mgmt/skills").install "skills/issue-cancel.md"
    (share/"issue-mgmt/skills").install "skills/issue-complete.md"
    (share/"issue-mgmt/skills").install "skills/issue-create.md"
    (share/"issue-mgmt/skills").install "skills/issue-edit.md"
    (share/"issue-mgmt/skills").install "skills/issue-history.md"
    (share/"issue-mgmt/skills").install "skills/issue-list.md"
    (share/"issue-mgmt/skills").install "skills/issue-search.md"
    (share/"issue-mgmt/skills").install "skills/issue-search-history.md"
    (share/"issue-mgmt/skills").install "skills/issue-note.md"
    (share/"issue-mgmt/skills").install "skills/issue-dep.md"
    (share/"issue-mgmt/skills").install "skills/issue-show.md"
    (share/"issue-mgmt/skills").install "skills/issue-show-at.md"
    (share/"issue-mgmt/skills").install "skills/issue-start.md"
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

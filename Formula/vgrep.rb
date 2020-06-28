require "language/go"

class Vgrep < Formula
  desc "vgrep is a pager for grep, git-grep and similar grep implementations, and allows for openening the indexed file locations in a user-specified editor such as vim or emacs"
  homepage "https://github.com/vrothberg/vgrep#readme"
  url "https://github.com/vrothberg/vgrep/archive/b137972b95e63f4c186c9f43534d3d64bdcb080e.tar.gz"
  version "b137972"
  sha256 "aa17cd462e11a8536e2b4c7adcdef029e3b42706e99d54396009dca31a73fbd2"

  depends_on "go" => :build

  def install
    system "make", "release"
    bin.install "build/vgrep"
  end

  test do
    (testpath/"test.txt").write("where is foo\n")
    assert_match "where is foo", shell_output("#{bin}/vgrep --no-git --no-ripgrep --no-less --no-header foo #{testpath}")
  end
end

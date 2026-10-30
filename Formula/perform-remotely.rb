class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.15"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.15/perform-remotely_0.5.15_darwin_arm64.tar.gz"
      sha256 "47b4e1d3dd37592c148e48254abb3564520d301c413614671a54a56189f6f167"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.15/perform-remotely_0.5.15_darwin_amd64.tar.gz"
      sha256 "4219d6175601a76a2746c8421f30a2d63f7d8967145a1731f887ad60c69b9c09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.15/perform-remotely_0.5.15_linux_arm64.tar.gz"
      sha256 "540887e410c1e4743c95cdf68cc14652713688c0ba34224df4e92f14e6262946"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.15/perform-remotely_0.5.15_linux_amd64.tar.gz"
      sha256 "e689bcfb06e44add3f645ec054feb17809fab3e1e2a34ac642b44d90181fc382"
    end
  end

  def install
    bin.install "perform-remotely"
  end

  def caveats
    <<~EOS
      perform-remotely runs in the background once you sign in:
        perform-remotely login
      It starts at every login, restarts if it fails, and restarts into a new
      version after brew upgrade. perform-remotely status says whether it runs,
      and perform-remotely logs -f shows what it does. To turn it off until
      perform-remotely start:
        perform-remotely stop
      Before brew uninstall, remove the background service, this worker on
      the platform and all its data on this machine (perform-remotely help
      lists every location):
        perform-remotely cleanup
    EOS
  end

  test do
    system "#{bin}/perform-remotely", "help"
  end
end

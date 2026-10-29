class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.13"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.13/perform-remotely_0.5.13_darwin_arm64.tar.gz"
      sha256 "8f0196fbcfa93fbcc2cd81f118d82dd94ed7f9a8531be5323a96dbd553c87208"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.13/perform-remotely_0.5.13_darwin_amd64.tar.gz"
      sha256 "85c34439336f77a578a14d953ce3403f24a25caa8ea812d10a6b6e7924587ca2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.13/perform-remotely_0.5.13_linux_arm64.tar.gz"
      sha256 "eeddc6adbb18e6608b6f60dcec753bd4d0a22b9e89c12930b2a00bc4a4dd30fe"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.13/perform-remotely_0.5.13_linux_amd64.tar.gz"
      sha256 "236efb8d75b7eb9fb32746b3302608c3acae562650e697b85338cdb4b1eea5d5"
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

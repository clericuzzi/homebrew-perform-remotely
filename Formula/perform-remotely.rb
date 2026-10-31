class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.16"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.16/perform-remotely_0.5.16_darwin_arm64.tar.gz"
      sha256 "19105b56d56bdd03c1a26af1ff19ed2768ae3e31e8c18c911dd2248a3b082515"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.16/perform-remotely_0.5.16_darwin_amd64.tar.gz"
      sha256 "735a27dd6e0dd92c3c281ea240aff5be6c96c0e3c1c78bfc83b50a507e1787d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.16/perform-remotely_0.5.16_linux_arm64.tar.gz"
      sha256 "52cd501f3b0673a19c536f1e8f9393bed05001834a30745c59a214b79ab22244"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.16/perform-remotely_0.5.16_linux_amd64.tar.gz"
      sha256 "c3887cdedf41e472fc84657246580d87768a044d82a731cad664ad0ed7f8843b"
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

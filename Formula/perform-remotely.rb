class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.6"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.6/perform-remotely_0.5.6_darwin_arm64.tar.gz"
      sha256 "21b18e7fa25da270463399c9aa69d312797109d61f7c288a126a3cf33024b59d"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.6/perform-remotely_0.5.6_darwin_amd64.tar.gz"
      sha256 "cdecc4afc857c0d96924a81f1dcf0e366f034909fd319ff52b1b9bcd855b15e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.6/perform-remotely_0.5.6_linux_arm64.tar.gz"
      sha256 "cb4a3a1b81364cbf296b968c63e79900cd82df7d743726bdfef232f12fc3e81c"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.6/perform-remotely_0.5.6_linux_amd64.tar.gz"
      sha256 "f4597ca16f270ec02af8fe6da4984d0d7aa06413421dad9817e4194e83f9eda0"
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

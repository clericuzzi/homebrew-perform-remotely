class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.6.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.6.0/perform-remotely_0.6.0_darwin_arm64.tar.gz"
      sha256 "889cf084033b5321af63ab307d3fe690feb116f73c3448b3a070a710ee266b11"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.6.0/perform-remotely_0.6.0_darwin_amd64.tar.gz"
      sha256 "c553846ae7f3688ab33f1bbe8b4be3d9417abf9cb476de236b3c583382b1b267"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.6.0/perform-remotely_0.6.0_linux_arm64.tar.gz"
      sha256 "adf2085b445493313baa4afd7525364253a3798c2104568e914d913d77f1e32d"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.6.0/perform-remotely_0.6.0_linux_amd64.tar.gz"
      sha256 "89c515defd84bca146001fcb6915733147bb5d5505cdd9d61a0cbe81b5a30c1a"
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

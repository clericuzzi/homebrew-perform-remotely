class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.4.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.4.0/perform-remotely_0.4.0_darwin_arm64.tar.gz"
      sha256 "22ee7bd401d516a6db57eb13525e08c41c2f0ef15af993f670da02b89a50eee2"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.4.0/perform-remotely_0.4.0_darwin_amd64.tar.gz"
      sha256 "6dc9b172b2ec4659367220e19f7757ea3590c74d77d61e2af0d2d8ef186a6387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.4.0/perform-remotely_0.4.0_linux_arm64.tar.gz"
      sha256 "d456398c6b0a2c5e24278c97402537664a1f2ec809d6a2778db67f7c265665cd"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.4.0/perform-remotely_0.4.0_linux_amd64.tar.gz"
      sha256 "6155f474110220b505047f6a9cc31bad8b3d9956998b9df7923cb7f9c016b156"
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

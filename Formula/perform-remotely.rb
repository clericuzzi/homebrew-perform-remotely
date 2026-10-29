class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.8"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.8/perform-remotely_0.5.8_darwin_arm64.tar.gz"
      sha256 "60be6895a8bd3cb761fcd109c4310356ef952476acf022e116717177fabb159a"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.8/perform-remotely_0.5.8_darwin_amd64.tar.gz"
      sha256 "e0606c068b288a1cfa08e95eb1ecc83f5d465786e8b4abff767f04ee178c265a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.8/perform-remotely_0.5.8_linux_arm64.tar.gz"
      sha256 "531f7fd12bfe5de96f543bbd3f833a46d467e8c79206c5264436751a5b33bace"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.8/perform-remotely_0.5.8_linux_amd64.tar.gz"
      sha256 "9d51b7905adae670c94dd59d6c38c8c1fbc0f60206346e92966bc0ce3403c80f"
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

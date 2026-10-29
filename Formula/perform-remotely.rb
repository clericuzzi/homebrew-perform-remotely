class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.11"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.11/perform-remotely_0.5.11_darwin_arm64.tar.gz"
      sha256 "4e420127400ea16bf69a76ad0b0e5fe3c9b5e1f6fb1c455b17debc1209b8483a"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.11/perform-remotely_0.5.11_darwin_amd64.tar.gz"
      sha256 "0eaa26d13d5f0140f31bfdc79f5d71c40a0b003378f4a98a466b27906ad43b2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.11/perform-remotely_0.5.11_linux_arm64.tar.gz"
      sha256 "a94cb9c21cb816f40245d05b22d153baf748bcefd4d1ede45cab64b5246a448b"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.11/perform-remotely_0.5.11_linux_amd64.tar.gz"
      sha256 "9f48ddf3def94de8311ca2d4c374e789620cab1cf6418a417c3954abd0ce13e9"
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

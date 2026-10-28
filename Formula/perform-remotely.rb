class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.4"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.4/perform-remotely_0.5.4_darwin_arm64.tar.gz"
      sha256 "b0c1b0936362d8c755ecd90288c4f2c8989cc187f1126dc4e2fa1cf66c1d4106"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.4/perform-remotely_0.5.4_darwin_amd64.tar.gz"
      sha256 "6638aab734e93304a9b03f1860b6e19e9d4fdaa1838d07ab7ab5d2214de8f9cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.4/perform-remotely_0.5.4_linux_arm64.tar.gz"
      sha256 "2ba631c3dce8dd6e1709d77ff933644e887ff201a5b3b13f9b66f44cd8537ea1"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.4/perform-remotely_0.5.4_linux_amd64.tar.gz"
      sha256 "d36b144020b5fdce736c5312f14892c832105cbdb132519e1e52e0cac93b6505"
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

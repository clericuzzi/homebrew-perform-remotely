class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.0/perform-remotely_0.5.0_darwin_arm64.tar.gz"
      sha256 "7ed77c41821f7d4e88d881ae9c6de43f9472fc358c03606a3bed4df2c30b28c7"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.0/perform-remotely_0.5.0_darwin_amd64.tar.gz"
      sha256 "4e702a0df042b8eaf7c379ecc2ceb2f830dffbbbcc72cf2df6418676890621e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.0/perform-remotely_0.5.0_linux_arm64.tar.gz"
      sha256 "6ded71c55d5929a3d2cc7e32a60592bbd56676d05b723c0772ccbfd4db7eebe2"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.0/perform-remotely_0.5.0_linux_amd64.tar.gz"
      sha256 "d491919e7273595a5812f6915c103e7180f41481cac02953583e9aa5cb3c547b"
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

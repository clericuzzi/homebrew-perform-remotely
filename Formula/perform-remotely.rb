class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.1"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.1/perform-remotely_0.5.1_darwin_arm64.tar.gz"
      sha256 "8abd180cbadefe7946a458241e9cf846cf4b43a18fe7221cabe57b76f7050a56"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.1/perform-remotely_0.5.1_darwin_amd64.tar.gz"
      sha256 "981523447b3b3faacb75cb6daa3d2a00dfd348246430a95a9bec8d40eb3cca50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.1/perform-remotely_0.5.1_linux_arm64.tar.gz"
      sha256 "d974c2edc6b2b2389607273b942a9f60bcf78399301f1fbfed43ea4a5f7a5aa4"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.1/perform-remotely_0.5.1_linux_amd64.tar.gz"
      sha256 "c3de16bd4eaf9ef895b65694280b0afc5957305cbfc37836c39ebe38548e52a6"
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

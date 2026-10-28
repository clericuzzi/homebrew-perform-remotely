class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.2"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.2/perform-remotely_0.5.2_darwin_arm64.tar.gz"
      sha256 "76863499dc470e5e93bdbb7b9885f5de407761206abf1629e12b95f9f6744206"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.2/perform-remotely_0.5.2_darwin_amd64.tar.gz"
      sha256 "80e0e8361d9a7f03135b22c50dc74691d88280fe76400dd8280b8d4153391059"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.2/perform-remotely_0.5.2_linux_arm64.tar.gz"
      sha256 "486f26a279854ce478652cceb2eb5bc9c1fd233a3b8764ce63aedde593a27639"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.2/perform-remotely_0.5.2_linux_amd64.tar.gz"
      sha256 "1f053158ee3b3b6a28f7cf038c817fb37d615f42d7d7a0be72e21490476b1d00"
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

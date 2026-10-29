class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.9"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.9/perform-remotely_0.5.9_darwin_arm64.tar.gz"
      sha256 "fc611de5dfba8a653abbc62cb7a9a218d64bb2d4e5bfb7460202bdc2b5ef9d9c"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.9/perform-remotely_0.5.9_darwin_amd64.tar.gz"
      sha256 "90a6a4b883e46a286aeb5a7213c1b49a1335b9682dc2d7c9d1693722d075363e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.9/perform-remotely_0.5.9_linux_arm64.tar.gz"
      sha256 "282d6c0e0269b098e1c51891e09dcd385f0e0be2c67974c78068d1c755ea8f3b"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.9/perform-remotely_0.5.9_linux_amd64.tar.gz"
      sha256 "d1a9127eddeec0c4103227bf5fe99d7774d84d74a25036307527bcb6944e532a"
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

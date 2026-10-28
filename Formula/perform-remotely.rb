class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.3.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.3.0/perform-remotely_0.3.0_darwin_arm64.tar.gz"
      sha256 "b1e1c928ff370112d7e27a900659a74c6b8a2b3256ad20041a91827a4b515677"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.3.0/perform-remotely_0.3.0_darwin_amd64.tar.gz"
      sha256 "ed4ccbeb232c10269620134bdf8f55860f8fad24c7085fcec0df858a2aecbbcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.3.0/perform-remotely_0.3.0_linux_arm64.tar.gz"
      sha256 "5c7d779a33ad796a854cb6f13c8b75c84641e8af5cc01bc252348057037873e2"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.3.0/perform-remotely_0.3.0_linux_amd64.tar.gz"
      sha256 "858be07deccced5c994ce6f51c750b7b84a1c083a4d4c060ac748a1139453ed1"
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

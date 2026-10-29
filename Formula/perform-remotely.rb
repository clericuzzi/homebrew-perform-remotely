class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.10"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.10/perform-remotely_0.5.10_darwin_arm64.tar.gz"
      sha256 "fb4628093812e596d83f8211cb23726ca868fcc11167dbc08f04d2abeb886f30"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.10/perform-remotely_0.5.10_darwin_amd64.tar.gz"
      sha256 "c5543c0c42667631ac77eda7c881fd5107e34fe2f9a08d3e7ca04ee29a065a72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.10/perform-remotely_0.5.10_linux_arm64.tar.gz"
      sha256 "0c7d4edb4ee3d264b58e4ae10e50d5b0d4c617e966922aa3bc6fba54d72258ff"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.10/perform-remotely_0.5.10_linux_amd64.tar.gz"
      sha256 "1451121e9353d593a6b3416c246de7fa13acbf06f5284ff072708ae028a1128e"
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

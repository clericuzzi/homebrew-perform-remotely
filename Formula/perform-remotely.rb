class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.14"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.14/perform-remotely_0.5.14_darwin_arm64.tar.gz"
      sha256 "fe841f2ba0ec4a592a5c417689e3d0e852accbb53595ddbf80c97b896ebf40c8"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.14/perform-remotely_0.5.14_darwin_amd64.tar.gz"
      sha256 "8ece860f8098b3aa56159cedd05704a991281ea7c0bf915b0e369889ac4649f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.14/perform-remotely_0.5.14_linux_arm64.tar.gz"
      sha256 "8bb93bf9a8a3322fff4f9587bca289ad7f0af1f3af2ea654e29d12c4182e2ddb"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.14/perform-remotely_0.5.14_linux_amd64.tar.gz"
      sha256 "b38643d21d460da5591a5c593f41f9e1519d233691ecb97fe74c711198ea8eb9"
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

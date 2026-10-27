class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.1.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_darwin_arm64.tar.gz"
      sha256 "eb6010b3bafd6c8f7666747f10c0070bd64eea6fa0f88fa6a974bddd43e2044a"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_darwin_amd64.tar.gz"
      sha256 "44a31fbc25ab4e7c3821058ae78a146140ec23b245d2c1225c6455b932f128fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_linux_arm64.tar.gz"
      sha256 "2c939e8a85e6c468b3c9121477cb7933f87ccf8a6421a8a3f90d1bf1762c1a22"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_linux_amd64.tar.gz"
      sha256 "1b49d57026eb7cb4142bb3d6ed1e3fdd8bd86e7f02faf89a2faa2586fa532de0"
    end
  end

  def install
    bin.install "perform-remotely"
  end

  test do
    system "#{bin}/perform-remotely", "help"
  end
end

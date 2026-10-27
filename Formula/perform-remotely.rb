class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.1.1"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.1/perform-remotely_0.1.1_darwin_arm64.tar.gz"
      sha256 "f0dfcdf34a544e17ef274b6dd7351959925b11466d2e961046186dac56955b70"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.1/perform-remotely_0.1.1_darwin_amd64.tar.gz"
      sha256 "09b4dfbe6b40ede27544f22b5af30758eee1b26ce7a17171b52367dc1e38eee1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.1/perform-remotely_0.1.1_linux_arm64.tar.gz"
      sha256 "302b829d309f61f819b295caeccae89e731423d733b0ff4bb72cfcd204b381bd"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.1/perform-remotely_0.1.1_linux_amd64.tar.gz"
      sha256 "f54a58abba3a1b0f81cb7ebcfe4acac25e78391713c2bad29f5ad655ec55b1ce"
    end
  end

  def install
    bin.install "perform-remotely"
  end

  test do
    system "#{bin}/perform-remotely", "help"
  end
end

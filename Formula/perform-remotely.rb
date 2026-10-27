class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_darwin_arm64.tar.gz"
      sha256 "98a062a7f7efa4d31bac2ab9b076d5cef9f8cc7e01cf6fdbdaf2f4c2872e8431"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_darwin_amd64.tar.gz"
      sha256 "f6502207eab95b113e6f3a048fba3acd5c474cbb8d0dab07fc6b2ae247eb9b1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_linux_arm64.tar.gz"
      sha256 "71405d5d641ee16ab5889a34d5fab8264c32defa681ac44aa145de73ba0f9fe2"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.1.0/perform-remotely_0.1.0_linux_amd64.tar.gz"
      sha256 "6d73672549fd01a928f4ab9770c4dd93938e5df4d02aec4c65ff7d72dda18eb5"
    end
  end

  on_macos do
    depends_on "terminal-notifier"
  end

  def install
    bin.install "perform-remotely"
  end

  test do
    system "#{bin}/perform-remotely", "help"
  end
end

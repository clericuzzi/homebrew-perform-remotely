class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.12"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.12/perform-remotely_0.5.12_darwin_arm64.tar.gz"
      sha256 "088a277606bc0c328951aed185fd2cf60e44ea9db51bdc44842187e79a188100"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.12/perform-remotely_0.5.12_darwin_amd64.tar.gz"
      sha256 "9cec8c6f9dddf1b1a6d7c2a8540eee7b8e7083d24a243711f501517a73a03c61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.12/perform-remotely_0.5.12_linux_arm64.tar.gz"
      sha256 "d12a7a71d75ec4e3fc402c418f48d5b62a8d072e2f7243090328544d0463895b"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.12/perform-remotely_0.5.12_linux_amd64.tar.gz"
      sha256 "6b16582a38814074e46a384475d837ccd36e9cfc05aa13ef84eef27b8f15466d"
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

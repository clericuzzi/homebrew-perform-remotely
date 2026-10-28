class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.2.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.2.0/perform-remotely_0.2.0_darwin_arm64.tar.gz"
      sha256 "b0534bb0997b9e9239b99af76f78a328b0ea23722a57e0a579c07e9e0076a329"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.2.0/perform-remotely_0.2.0_darwin_amd64.tar.gz"
      sha256 "1803fd0a633525e699692f905764d5e41d010791867112c05a324d60bed71eb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.2.0/perform-remotely_0.2.0_linux_arm64.tar.gz"
      sha256 "88f9a7cdead0c90edd4f55fcd7234b7ab94a1c4199d5f85cc344339881aa31f8"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.2.0/perform-remotely_0.2.0_linux_amd64.tar.gz"
      sha256 "b5073144b706e189ee8bbddffd50a21de934266e078f437f52f3c565af2cf082"
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
      Before brew uninstall, remove its background service:
        perform-remotely stop --remove
    EOS
  end

  test do
    system "#{bin}/perform-remotely", "help"
  end
end

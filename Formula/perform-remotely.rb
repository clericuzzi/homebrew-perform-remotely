class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.5"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.5/perform-remotely_0.5.5_darwin_arm64.tar.gz"
      sha256 "6aa7adeefa0f21b30dc5ec814de9834e9a4641d698b22789a7cb63bb029f18b0"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.5/perform-remotely_0.5.5_darwin_amd64.tar.gz"
      sha256 "e05ee8f268529a48f07a6beafa6e41239c1381ff2de8b53367f21164c1da7d4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.5/perform-remotely_0.5.5_linux_arm64.tar.gz"
      sha256 "2bbda7813d7f697b18d249bc71d98bf64c009ae06522dc4d54ff28df97097755"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.5/perform-remotely_0.5.5_linux_amd64.tar.gz"
      sha256 "93198032781bebadb41c7306b7e02fe27e95bfce4dad475397fc4ab550bcedbc"
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

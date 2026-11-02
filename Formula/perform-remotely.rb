class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.7.0"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.0/perform-remotely_0.7.0_darwin_arm64.tar.gz"
      sha256 "f24626dcfda8fe6c68e5f3a419a737d283f53b7cf98b8e677ecf7f1506ef59d6"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.0/perform-remotely_0.7.0_darwin_amd64.tar.gz"
      sha256 "759ff1072a0ae9b7918c3d69074b6fddd721b111e8c0a788baae16b897b5148b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.0/perform-remotely_0.7.0_linux_arm64.tar.gz"
      sha256 "4821507472f9f2be33a7f71cf97708e1152fdf8bc8cd2817a1ca692fa79d4d80"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.0/perform-remotely_0.7.0_linux_amd64.tar.gz"
      sha256 "7e476f339915ca2443ca66e568916c8adf4ae749500f9833003a06720c95edd8"
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

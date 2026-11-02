class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.7.1"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.1/perform-remotely_0.7.1_darwin_arm64.tar.gz"
      sha256 "8c6b833daecb9d7e424497a4e8f4251e4576aefa894b8f6c6ee572c5739f7f13"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.1/perform-remotely_0.7.1_darwin_amd64.tar.gz"
      sha256 "1f977dfb3b9d4a882f894e0b6a9375e0734defd1cd7d8cf5764fe54897cb281b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.1/perform-remotely_0.7.1_linux_arm64.tar.gz"
      sha256 "38ddda00076f965ab93add7b79df4faa0b291bfa0c294e557ee96065e6f46e36"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.7.1/perform-remotely_0.7.1_linux_amd64.tar.gz"
      sha256 "6c8feee5484b92022b66270eba6288af604572aa7f300360ee83658d04695e41"
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

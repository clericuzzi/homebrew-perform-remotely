class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.3"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.3/perform-remotely_0.5.3_darwin_arm64.tar.gz"
      sha256 "911ac66c83e7dff6a883821fe8a0a44760024cae70699d70538550f439294a4b"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.3/perform-remotely_0.5.3_darwin_amd64.tar.gz"
      sha256 "d6eb1a54dfaa8f234649b122886fc266870aff4543596aeecb7131c9899e1204"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.3/perform-remotely_0.5.3_linux_arm64.tar.gz"
      sha256 "cd6ff76cbcf34f6c6b509fe295f491c590577c3c7fe5f105150fd49f7b9e9c5f"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.3/perform-remotely_0.5.3_linux_amd64.tar.gz"
      sha256 "749a2cb80373e5a98213cfed2f54eb89b490bb64672e01d30580da454606948f"
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

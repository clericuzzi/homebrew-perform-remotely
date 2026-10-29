class PerformRemotely < Formula
  desc "Background worker for perform-remotely, run on your own machine"
  homepage "https://github.com/clericuzzi/homebrew-perform-remotely"
  version "0.5.7"

  on_macos do
    depends_on "terminal-notifier"

    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.7/perform-remotely_0.5.7_darwin_arm64.tar.gz"
      sha256 "995d2de54972448b0f4af0d96830aab9f984ec8866b95af346a7644aa56d6beb"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.7/perform-remotely_0.5.7_darwin_amd64.tar.gz"
      sha256 "5dd69adf15175617853143a74b70a032e13ba58732d634ccc7607fba90be487d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.7/perform-remotely_0.5.7_linux_arm64.tar.gz"
      sha256 "2b9161dae175d2e4df0e9ae8fdedd5392cd68511b0b3d57a3fa7b11b5f4fb7f5"
    end
    on_intel do
      url "https://github.com/clericuzzi/homebrew-perform-remotely/releases/download/v0.5.7/perform-remotely_0.5.7_linux_amd64.tar.gz"
      sha256 "cdf1f7d7b43dd400ee9dc11bdcf7c078f5e280a980744c8f6c3e0c0bf421dd02"
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

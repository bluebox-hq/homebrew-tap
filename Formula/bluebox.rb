# Generated on every Bluebox CLI release. Changes made here are overwritten.
class Bluebox < Formula
  desc "Command-line interface for Bluebox"
  homepage "https://docs.bluebox.ai/cli"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.1/bluebox_1.14.1_darwin_arm64.tar.gz"
      sha256 "d6f3bfb629a240a92f6cda7356e7c7303ff4b8c406e2c9728b0b531d1da1d70c"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.1/bluebox_1.14.1_darwin_amd64.tar.gz"
      sha256 "9c805954fa63a115755b5547a4631eb018b8a5fa10f09be8391695f53e52b35d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.1/bluebox_1.14.1_linux_arm64.tar.gz"
      sha256 "e55e73268559d17fa084f1f1a1eff7f39ba0dc412a8ccb89409a9bfc5c5c51d3"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.1/bluebox_1.14.1_linux_amd64.tar.gz"
      sha256 "d2ceaaff0953f6287d7f14e3a5b3729ec6e5438549f176f311c6353081d4621d"
    end
  end

  def install
    bin.install "bluebox"
    bash_completion.install "completions/bluebox.bash" => "bluebox"
    zsh_completion.install "completions/bluebox.zsh" => "_bluebox"
    fish_completion.install "completions/bluebox.fish"
    prefix.install "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/bluebox version")
    assert_match "brew upgrade bluebox-hq/tap/bluebox", shell_output("#{bin}/bluebox update")
  end
end

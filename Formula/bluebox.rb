# Generated on every Bluebox CLI release. Changes made here are overwritten.
class Bluebox < Formula
  desc "Command-line interface for Bluebox"
  homepage "https://docs.bluebox.ai/cli"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.0/bluebox_1.14.0_darwin_arm64.tar.gz"
      sha256 "38ad3e720c037267d859d0820a061b5e829a1493c0b0d7960f055f4b74175e9c"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.0/bluebox_1.14.0_darwin_amd64.tar.gz"
      sha256 "2fdd234029dd829d9f7d6bb10e5c4721331d857c0ae6c896ae44c4300e28e00c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.0/bluebox_1.14.0_linux_arm64.tar.gz"
      sha256 "cf8d90cd8fc293dd4545599b0008a2d2a097163eb072344851f1e5fc48ccd359"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.14.0/bluebox_1.14.0_linux_amd64.tar.gz"
      sha256 "1e6bd9d3f861dea20f9b37a85be7101d1c7df97f3e21b087e83eea544ee44ced"
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

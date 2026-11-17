# Generated on every Bluebox CLI release. Changes made here are overwritten.
class Bluebox < Formula
  desc "Command-line interface for Bluebox"
  homepage "https://docs.bluebox.ai/cli"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.12.0/bluebox_1.12.0_darwin_arm64.tar.gz"
      sha256 "f580d404ab93746cbd2ceae731dac76ef8d448735afff88096450f2ed2a1ee96"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.12.0/bluebox_1.12.0_darwin_amd64.tar.gz"
      sha256 "345a4618b04ae26f202e684a49db2350953563a4634752dcd4d718c2b75ddc69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.12.0/bluebox_1.12.0_linux_arm64.tar.gz"
      sha256 "a25df45e38e9c9a5e07cb30b41dcbb64c87d885761a5bf28a87b78a5ebb461dd"
    end
    on_intel do
      url "https://github.com/bluebox-hq/bluebox-cli/releases/download/v1.12.0/bluebox_1.12.0_linux_amd64.tar.gz"
      sha256 "9d276856aeff4707f7230937e7ec891eac0971d29948659974fded6318fccd68"
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

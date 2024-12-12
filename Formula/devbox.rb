# Copyright Jetpack Technologies Inc, Joseph Page
# SPDX-License-Identifier: Apache-2.0

class Devbox < Formula
  desc "Portable, Isolated Dev Environments on any Machine"
  homepage "https://www.jetpack.io/devbox"
  version "0.13.7"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_darwin_amd64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "574f4a06cd2a1c234f92365abe9184f7545c7ec29af43316cdcf247a31b6880e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_darwin_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "440655fd9444fb9c5761dd446d81a3595b8a37db50037a81179d6e5a29aff25f"
  elsif OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_386.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "c158ef48dd7120be195f6e4ef39e06a9a41ba51e766bad15cb6a2ecf0204a64a"
  elsif OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_amd64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "3c210f40a1aa9c0734eaf92fb9853575213d1c91772c19a857e706eee30deddd"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_armv7l.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "527ce8cae7eeb4698e04ea86a18b7af00908dc3667f94199eae9d0a0ba14ec2c"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "73b3cc9f406d57bbaf6c36b70396bca99d42fa43c21a1de445ed0501fb9cb4e0"
  else
    odie "Unexpected platform!"
  end

  def install
    bin.install "devbox" => "devbox"
  end

  def post_install
    generate_completions_from_executable(bin/"devbox", "completion")
  end

  test do
    system "#{bin}/devbox", "--version"
  end
end

# Copyright Jetpack Technologies Inc, Joseph Page
# SPDX-License-Identifier: Apache-2.0

class Devbox < Formula
  desc "Portable, Isolated Dev Environments on any Machine"
  homepage "https://www.jetify.com/devbox"
  license "Apache-2.0"

  version "0.14.0"
  # When updating the version here, make sure to also update the SHA-256 checksums below
  # using the checksums.txt file provided with the GitHub release.

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_darwin_amd64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "daaac73377d8beb98d7bbc854b90a8fec2d71984779a314535c166b555ce0a36"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_darwin_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "d0329c00376c83611627860d7884b304880a31bcb69f1ce394244229a7c4c95c"
  elsif OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_386.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "d729025652894a982e3dfa4f138feefb370b29eda34b1240c0420987637d7d88"
  elsif OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_amd64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "30c27a1eefd555481bda2f91b4ccc690a64fdaa87b809506bfdac01fc9ce4232"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "5d902434e931e8184ae1fd69bc731a439aa8edcb9b064036773bcc2efbad49f7"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_armv7l.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "849e76b819e35beeafb3021e5fcc0e1816ee477a2242391de97127e40c5382b0"
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

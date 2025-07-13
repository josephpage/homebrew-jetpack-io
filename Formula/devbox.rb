# Copyright Jetpack Technologies Inc, Joseph Page
# SPDX-License-Identifier: Apache-2.0

class Devbox < Formula
  desc "Portable, Isolated Dev Environments on any Machine"
  homepage "https://www.jetify.com/devbox"
  license "Apache-2.0"

  version "0.15.0"
  # When updating the version here, make sure to also update the SHA-256 checksums below
  # using the checksums.txt file provided with the GitHub release.

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_darwin_amd64.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "03e6b1d9d9c714b33a58f2e769f0675604b70333656e21880424ce6f10ae7b14"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_darwin_arm64.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "8bb45045954e510b40a9184c35bdac43bbd860197b216bad6cf66d31ab573977"
  elsif OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_linux_386.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "fc4b52f6f79f2ed6af07c8775883e17bd421e6c48fae36688860089da5da2f05"
  elsif OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_linux_amd64.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "7cbf51cea3f7530c96dc674f0217e8dc85fbdc78a97de773cc497104ad4024f6"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_linux_arm64.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "becdf4c90af69310f44fe41d6a972c146e4e9c48076fed434836236ae9ccae9f"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetify-com/devbox/releases/download/#{version}/devbox_#{version}_linux_armv7l.tar.gz",
      verified: "github.com/jetify-com/devbox/"
    sha256 "3b739ef4669772c6bcd5aa7780e675fc4778ff479f89dffe757e2abf7fb0b676"
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

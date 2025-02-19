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
    sha256 "ba7d10c437e0c2d8b9344c538bda5593d275dc16e9929259b1e8026a9ba85067"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_darwin_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "aee1581a10dca316b6f2417ba091d647949c713c0622017ad18dbdbab47026f3"
  elsif OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_386.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "a4712cc6c115173c43c4ada6cba8ac114b39e52893139111e34b9088a5a19aab"
  elsif OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_amd64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "785f40afa590b3d367c3017b5b4c7444b44458958db9861707335a54ec444f90"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_armv7l.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "540ec8d60de699ccb25c27bc0a3463509413cbec0e0997d73cb0ffc2fef90ddd"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jetpack-io/devbox/releases/download/#{version}/devbox_#{version}_linux_arm64.tar.gz",
      verified: "github.com/jetpack-io/devbox/"
    sha256 "04020ae5539dc1c24fce940b2c313211bbd1d30e859b1245f291e12ee9488abc"
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


require 'formula'

class Ethereum < Formula
  homepage 'https://github.com/tendermint/tendermint'
  url 'https://github.com/tendermint/tendermint.git', :tag => 'v0.10.0'

  devel do
    url 'https://github.com/tendermint/tendermint.git', :branch => 'master'
  end

  depends_on 'go' => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    system "go", "env" # Debug env
    system "make", "get_vendor_deps"
    system "make", "build"
    bin.install 'build/bin/tendermint'
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/tendermint", "version"
  end
end

require 'formula'

class Tendermint < Formula
  homepage 'https://github.com/tendermint/tendermint'
  url 'https://github.com/tendermint/tendermint/releases/download/v0.10.3/tendermint_0.10.3_darwin_amd64.zip'
  head 'https://github.com/tendermint/tendermint.git'
  
  bottle do
    cellar :any
    sha256 "731408b6550caa6954904e3ad1a926f1724de54cfd243fe02828f40cd392575b" => :sierra
    sha256 "731408b6550caa6954904e3ad1a926f1724de54cfd243fe02828f40cd392575b" => :el_capitan
    sha256 "731408b6550caa6954904e3ad1a926f1724de54cfd243fe02828f40cd392575b" => :yosemite
  end

  devel do
    url 'https://github.com/tendermint/tendermint.git', :branch => 'master'
  end

  depends_on 'go' => :build
  depends_on 'glide' => :glide

  def install
      ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
      ENV["GOPATH"] = buildpath
      tendermintpath = buildpath/"src/github.com/tendermint/tendermint"
      tendermintpath.install buildpath.children

      cd tendermintpath do
          system "go", "env" # Debug env
          system "glide", "--version" # Debug env
          system "make", "get_vendor_deps"
          system "make", "build"
          bin.install 'build/tendermint'
      end
  end


  test do
      system "#{HOMEBREW_PREFIX}/bin/tendermint", "version"
  end
end

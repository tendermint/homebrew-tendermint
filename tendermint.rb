require 'formula'

class Tendermint < Formula
  homepage 'https://github.com/tendermint/tendermint'
  url 'https://github.com/tendermint/tendermint.git', :tag => 'v0.10.2'

  devel do
    url 'https://github.com/tendermint/tendermint.git', :branch => 'master'
  end

  depends_on 'go' => :build
  depends_on 'glide' => :glide

  def install
      ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
      ENV["GOPATH"] = buildpath
      tendermintpath = buildpath/src/github.com/tendermint/tendermint
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

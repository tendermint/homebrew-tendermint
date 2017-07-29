require 'formula'

class Ethermint < Formula
    homepage 'https://github.com/tendermint/ethermint'
    url 'https://github.com/tendermint/ethermint.git', :tag => 'v0.4.0'

    devel do
        url 'https://github.com/tendermint/ethermint.git', :branch => 'develop'
    end

    depends_on 'go' => :build
    depends_on 'glide' => :glide

    def install
        ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
        system "go", "env" # Debug env
        system "make", "get_vendor_deps"
        system "make", "build"
        bin.install 'build/ethermint'
    end


    test do
        system "#{HOMEBREW_PREFIX}/bin/ethermint", "version"
    end
end
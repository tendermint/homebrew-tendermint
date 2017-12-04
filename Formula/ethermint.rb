require "formula"

class Ethermint < Formula
  desc 'Ethereum powered by Tendermint consensus'
  homepage 'https://github.com/tendermint/ethermint'
  url 'https://s3-us-west-2.amazonaws.com/tendermint/binaries/ethermint/0.5.3/ethermint_0.5.3_darwin-10.6-amd64.zip'
  sha256 '75040beb16b8fae6932a893616a2e3f8ee20a2e7957befecb7d7d5fcdf0e5ab9'
  version 'v0.5.3'

  bottle :unneeded

  def install
    if File.exist?('ethermint') # pre-build binary
      bin.install 'ethermint'
    else # build from source
      ENV['GOPATH'] = buildpath
      ethermintpath = buildpath/"src/github.com/tendermint/ethermint"
      ethermintpath.install buildpath.children
      cd ethermintpath do
        system 'make', 'get_vendor_deps'
        system 'make', 'build'
        bin.install 'build/ethermint'
      end
    end
  end

  head do
    url 'https://github.com/tendermint/ethermint.git',
      :branch => 'develop'

    depends_on 'go' => :build
    depends_on 'glide' => :glide
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ethermint version")
  end
end

require "formula"

class Tendermint < Formula
  desc 'Tendermint Core (BFT Consensus) in Go'
  homepage 'https://tendermint.com/'
  url 'https://s3-us-west-2.amazonaws.com/tendermint/binaries/tendermint/v0.12.1/tendermint_0.12.1_darwin_amd64.zip'
  sha256 '807b29cabc4e372aaee93347f617db8b88bf68c80cb40254c8cd0bd13110d51c'
  version 'v0.12.1'

  bottle :unneeded

  def install
    if File.exist?('tendermint') # pre-build binary
      bin.install 'tendermint'
    else # build from source
      ENV["GOPATH"] = buildpath
      tendermintpath = buildpath/"src/github.com/tendermint/tendermint"
      tendermintpath.install buildpath.children
      cd tendermintpath do
        system 'make', 'get_vendor_deps'
        system 'make', 'build'
        bin.install 'build/tendermint'
        prefix.install_metafiles
      end
    end
  end

  head do
    url 'https://github.com/tendermint/tendermint.git',
      :branch => 'develop'

    depends_on 'go' => :build
    depends_on 'glide' => :glide
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tendermint version")
  end
end

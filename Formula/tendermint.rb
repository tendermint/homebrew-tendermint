class Tendermint < Formula
  desc "Byzantine fault-tolerant replicated state machines in any programming language"
  homepage "https://tendermint.com/"
  if ARGV.build_from_source?
    url "https://github.com/tendermint/tendermint/releases/download/v0.12.1/darwin_amd64.zip"
    version "0.12.1"
    sha256 "128e89ec0dcfe5ed86a4effb3cbc1c8e37f09ae9ab5314f097dce4f06618d545"
  else
    url "https://s3-us-west-2.amazonaws.com/tendermint/binaries/tendermint/v0.12.1/tendermint_0.12.1_darwin_amd64.zip"
    version "0.12.1"
    sha256 "807b29cabc4e372aaee93347f617db8b88bf68c80cb40254c8cd0bd13110d51c"
  end

  head do
    url "https://github.com/tendermint/tendermint.git",
      :branch => "develop"

    depends_on "go" => :build
    depends_on "glide" => :optional
  end

  bottle :unneeded

  def install
    if ARGV.build_from_source? || ARGV.build_head?
      ENV["GOPATH"] = buildpath
      tendermintpath = buildpath/"src/github.com/tendermint/tendermint"
      tendermintpath.install buildpath.children
      cd tendermintpath do
        system "make", "get_vendor_deps"
        system "make", "build"
        bin.install "build/tendermint"
        prefix.install_metafiles
      end
    else
      bin.install "tendermint"
    end
  end

  test do
    tendermint_version_without_hash = shell_output("#{bin}/tendermint version").partition("-").first
    assert_match version.to_s, tendermint_version_without_hash
  end
end

require "language/node"

class Jowl < Formula
  desc "CLI for JSON operations with Lodash"
  homepage "https://jowl.app"
  url "https://registry.npmjs.org/jowl/-/jowl-2.0.0.tgz"
  sha256 "5e1b654df75649730eeb3a6f70119be0cae01896e46137f64b0e112911647ec7"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node@16"

  def install
    system "npm", "install", "--production", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Until we have a better strategy for running the integration suite here,
    # this sample from that suite is unlikely to ever change and is a reasonable
    # coherency check.
    pipe_output("#{bin}/jowl 'd[0]'", '["one", "two"]', '"one"\n', 0)
  end
end

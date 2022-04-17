class Xshe < Formula
  version '0.4.0'
  desc "Set Shell Environment variables across multiple shells with a single configuration file."
  homepage "https://github.com/superatomic/xshe"
  license any_of: ["MIT", "Apache-2.0"]
  url "https://github.com/superatomic/xshe/archive/v#{version}.zip"
  sha256 "bae941c2a6bd1e5489dacf8a4c2892f347597e4143b50e1c2781338bf31d8e92"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/xshe bash -t 'HELLO = \"World\"'"
  end
end
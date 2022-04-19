class Xshe < Formula
  version '0.4.1'
  desc "Set Shell Environment variables across multiple shells with a single configuration file."
  homepage "https://github.com/superatomic/xshe"
  license any_of: ["MIT", "Apache-2.0"]
  url "https://github.com/superatomic/xshe/archive/v#{version}.zip"
  sha256 "bae941c2a6bd1e5489dacf8a4c2892f347597e4143b50e1c2781338bf31d8e92"
  head "https://github.com/superatomic/xshe.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    out_dir = Dir["target/release/build/xshe-*/out"].first
    man1.install "#{out_dir}/xshe.1"
    bash_completion.install "#{out_dir}/xshe.bash"
    zsh_completion.install "#{out_dir}/_xshe"
    fish_completion.install "#{out_dir}/xshe.fish"
  end

  test do
    system "#{bin}/xshe bash -t 'HELLO = \"World\"'"
  end
end

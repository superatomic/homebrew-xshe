class Xshe < Formula
  version '0.4.2'
  desc "Set Shell Environment variables across multiple shells with a single configuration file."
  homepage "https://github.com/superatomic/xshe"
  license any_of: ["MIT", "Apache-2.0"]
  url "https://github.com/superatomic/xshe/archive/v#{version}.zip"
  sha256 "26c92a7c5644000a5951764cffb0ee3bdf3954fc3308ced05902a70015ebf210"
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

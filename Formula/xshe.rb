class Xshe < Formula
  version '0.5.1'
  desc "Cross-Shell Environment Variables Manager"
  homepage "https://github.com/superatomic/xshe"
  license any_of: ["MIT", "Apache-2.0"]
  url "https://github.com/superatomic/xshe/archive/v#{version}.zip"
  sha256 "76b535ef24b07630556e75530549fa9caedcaa0144981b10ea338dcf15d8a2dd"
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

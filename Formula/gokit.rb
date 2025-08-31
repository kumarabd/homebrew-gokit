class Gokit < Formula
  desc "GoKit - Microservice development toolkit"
  homepage "https://github.com/kumarabd/gokit"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumarabd/gokit/releases/download/v#{version}/gokit-darwin-arm64"
      sha256 "0ba9b97ed8a5ca1716bab5de46bc8eab63f424ab136c59825a180af6059a3fb7"
    else
      url "https://github.com/kumarabd/gokit/releases/download/v#{version}/gokit-darwin-amd64"
      sha256 "03e0f0df809ab25f9b9aa4e2afdd69c0bd4eede96dcde87a9b1980d61d35961c"
    end
  end

  on_linux do
    url "https://github.com/kumarabd/gokit/releases/download/v#{version}/gokit-linux-amd64"
    sha256 "6e187fdbe9663cababb6becc9127eff58bde911f3d1a45e5d780251d936701a3"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "gokit-darwin-arm64" => "gokit"
      else
        bin.install "gokit-darwin-amd64" => "gokit"
      end
    else
      bin.install "gokit-linux-amd64" => "gokit"
    end
  end

  test do
    system "#{bin}/gokit", "version"
  end
end

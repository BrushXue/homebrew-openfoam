cask "openfoam2206" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.6"
  sha256 arm:   "64a18b695b9d8524a2fff50dad2080c441320e3ae0c3101cc7b24a0dc66da0d8",
         intel: "3303a257b4802e3a84fc0e8de55b1e5a8014b10f2549c8940f833a46c705d612"

  url "https://github.com/gerlero/openfoam-app/releases/download/v#{version}/openfoam2206-app-homebrew-#{arch}.zip"
  name "OpenFOAM v2206"
  desc "Open-source toolbox for Computational Fluid Dynamics (CFD)"
  homepage "https://github.com/gerlero/openfoam-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "bash"
  depends_on formula: "open-mpi"
  depends_on formula: "libomp"
  depends_on formula: "adios2"
  depends_on formula: "boost"
  depends_on formula: "fftw"
  depends_on formula: "kahip"
  depends_on formula: "metis"
  depends_on formula: "gerlero/openfoam/cgal@4"
  depends_on formula: "gerlero/openfoam/scotch-no-pthread"

  app "OpenFOAM-v2206.app"
  binary "#{appdir}/OpenFOAM-v2206.app/Contents/Resources/etc/openfoam", target: "openfoam2206"

  uninstall script: {
    executable:   "#{staged_path}/OpenFOAM-v2206.app/Contents/Resources/volume",
    args:         ["eject"],
    must_succeed: false,
  }
end

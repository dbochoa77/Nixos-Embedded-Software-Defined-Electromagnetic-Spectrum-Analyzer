{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    rtl-sdr
    usbutils
    python3
    python3Packages.gpiozero
    python3Packages.numpy
    python3Packages.scipy
    python3Packages.matplotlib
    python3Packages.pyrtlsdr

    (pkgs.python3.withPackages (ps: with ps; [
      pyrtlsdr
      numpy
      scipy
      matplotlib
      gpiozero
    ]))
  ];
}

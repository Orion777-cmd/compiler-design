{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.flex
    pkgs.gcc
    pkgs.glibc
  ];
}

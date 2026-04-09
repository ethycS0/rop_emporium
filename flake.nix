{
  description = "ROPEmporium Exploit Tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    pwndbg.url = "github:pwndbg/pwndbg";

  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      pwndbg,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python3
            gdb
            ghidra

            python313Packages.ropper
            ropgadget
            pwntools
            radare2
            pwndbg.packages.${system}.pwndbg
          ];

          NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.stdenv.cc.cc
            pkgs.glibc
          ];
          NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
        };
      }
    );
}

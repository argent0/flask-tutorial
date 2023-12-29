{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nvim-python.url = "github:argent0/flake-nvim-python";
  };

  outputs = { self, nixpkgs, nvim-python }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux; 
  in {
    devShell.x86_64-linux = nvim-python.lib.neovimForPython { 
      extraNixDerivations = [
        pkgs.watchexec
      ];
    };
  };
}

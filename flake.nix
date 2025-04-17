{
  description = "level 1 flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux"; #System

      hostname = "nixos"; #Hostname
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/madeline/configuration.nix
        ];
      };
    };
}

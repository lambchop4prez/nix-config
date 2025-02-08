{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-bundle, homebrew-cask }:
  let
    user = "tmc";
    darwinSystems = ["aarch64-darwin" "x86_64-darwin"];
    linuxSystems = ["aarch64-linux" "x86_64-linux"];
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Rudy
    darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (system:
      darwin.lib.darwinSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              inherit user;
              enable = true;
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
              };
              mutableTaps = false;
              autoMigrate = true;
            };
          }
          ./hosts/darwin
        ];
      }
    );

    linuxConfigurations = nixpkgs.lib.genAttrs linuxSystems (system:
      nippkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/nixos
        ];
      }
    );
  };
}

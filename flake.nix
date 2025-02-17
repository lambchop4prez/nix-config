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
    macs = {
      "Rudy" = {
        system = "x86_64-darwin";
      };
      "Jocelyn" = {
        system = "aarch64-darwin";
      };
      "Lenny" = {
        system = "aarch64-darwin";
      };
    };
    macHosts = nixpkgs.lib.attrNames macs;
    darwinSystems = ["aarch64-darwin" "x86_64-darwin"];
    linuxSystems = ["aarch64-linux" "x86_64-linux"];
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Rudy
    test = nixpkgs.lib.attrNames macs;
    darwinConfigurations = nixpkgs.lib.genAttrs macHosts (host:
      darwin.lib.darwinSystem {
        system = macs.${host}.system;
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

    nixosConfigurations = nixpkgs.lib.genAttrs linuxSystems (system:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/nixos
        ];
      }
    );
  };
}

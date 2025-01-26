{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs }:
  let
    darwinSystems = ["aarch64-darwin" "x86_64-darwin"];
    # configuration = { pkgs, ... }: {
    #   # List packages installed in system profile. To search by name, run:
    #   # $ nix-env -qaP | grep wget
    #   environment.systemPackages =
    #     [
    #       pkgs.vim
    #       pkgs.curl

    #     ];

    #   # Necessary for using flakes on this system.
    #   nix.settings.experimental-features = "nix-command flakes";

    #   # Enable alternative shell support in nix-darwin.
    #   # programs.fish.enable = true;

    #   # Set Git commit hash for darwin-version.
    #   system.configurationRevision = self.rev or self.dirtyRev or null;

    #   # Used for backwards compatibility, please read the changelog before changing.
    #   # $ darwin-rebuild changelog
    #   system.stateVersion = 5;

    #   # The platform the configuration will be used on.
    #   nixpkgs.hostPlatform = "aarch64-darwin";
    # };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Rudy

    darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (system: 
      darwin.lib.darwinSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/darwin
        ];
      }
    );
    # darwinConfigurations."Rudy" = darwin.lib.darwinSystem {
    #   modules = [ configuration ];
    # };
    # darwinConfigurations."Lenny" = darwin.lib.darwinSystem {
    #   modules = [ configuration ];
    # };
  };
}

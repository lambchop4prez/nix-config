{ pkgs, self, ...}:
let
  user = "tmc";
in
{
    nix = {
        package = pkgs.nix;
        settings = {
            trusted-users = ["@admin" "${user}"];
            substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
            trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
            experimental-features = "nix-command flakes";
        };
    };
    nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
    };
    environment.systemPackages = with pkgs; (import ./packages.nix { inherit pkgs; });
    fonts.packages = with pkgs; [
        nerd-fonts.hack
        nerd-fonts.intone-mono
     ];
}

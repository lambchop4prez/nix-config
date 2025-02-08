{ pkgs, self, ...}:
let
  user = "tmc";
in
{
  nix = {
        package = pkgs.nix;
        settings = {
            trusted-users = ["@admin" "${user}"];
            experimental-features = "nix-command flakes";
        };
    };
  environment.systemPackages = with pkgs; (import ./packages.nix { inherit pkgs; });
}

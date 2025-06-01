{ pkgs, self, ...}:
let
  user = "tmc";
in
{
    nix = {
        package = pkgs.nix;
    };
    environment.systemPackages = with pkgs; (import ./packages.nix { inherit pkgs; });
    # fonts.packages = with pkgs; [
    #     (nerd-fonts.override { fonts = [ "IntelOneMono" ]; })
    #     intel-one-mono
    # ];
}

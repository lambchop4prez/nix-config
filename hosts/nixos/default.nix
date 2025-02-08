{ pkgs, self, ... }:
let
  user = "tmc";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/shared
  ];
  # boot = {
  #   loader = {
  #     systemd-boot = {
  #       enabled = true;
  #       configurationLimit = 32;
  #     };
  #   };
  # };
  system = {
    stateVersion = "24.11";
  };
}

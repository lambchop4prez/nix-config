{ pkgs, self, ... }:
let
  user = "tmc";
in
{
  imports = [
    ../../modules/shared
  ];
  system = {
    stateVersion = "25.05";
  };
}

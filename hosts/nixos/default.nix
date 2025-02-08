{ pkgs, self, ... }:
let
  user = "tmc";
in
{
  imports = [
    ../../modules/shared
  ];
}

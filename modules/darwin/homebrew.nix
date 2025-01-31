{config, pkgs, ...}:
{
    homebrew = {
        enable = true;
        casks = pkgs.callPackage ./casks.nix {};
    };
}
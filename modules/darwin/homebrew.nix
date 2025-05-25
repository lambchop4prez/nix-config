{config, pkgs, ...}:
{
    homebrew = {
        enable = true;
        casks = pkgs.callPackage ./casks.nix {};
        masApps = {
            "Bitwarden" = 1352778147;
            "AdGuard for Safari" = 1440147259;
        }
    };
}

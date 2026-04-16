{config, pkgs, ...}:
{
    homebrew = {
        enable = true;
        enableZshIntegration = true;
        casks = pkgs.callPackage ./casks.nix {};
        brews = [
            { name = "libiconv"; }
        ];
        masApps = {
            "Bitwarden" = 1352778147;
            "AdGuard for Safari" = 1440147259;
        };
    };
}

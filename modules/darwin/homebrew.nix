{config, pkgs, ...}:
{
    homebrew = {
        enable = true;
        enableZshIntegration = true;
        casks = pkgs.callPackage ./casks.nix {};
        brews = [
            { name = "libiconv"; }
            { name = "neovim"; }
        ];
        onActivation = {
            autoUpdate = true;
            cleanup = "uninstall";
            upgrade = true;
        };
        taps = ["jundot/homebrew-omlx"];
        masApps = {
            # "Bitwarden" = 1352778147;
            # "AdGuard for Safari" = 1440147259;
        };

    };
}

{config, lib, pkgs, ...}:
{
    homebrew = {
        enable = true;
        enableZshIntegration = true;
        casks = pkgs.callPackage ./casks.nix {};
        brews = [
            { name = "libiconv"; }
            { name = "neovim"; }
            { name = "colima"; }
            { name = "hermes-agent"; }
            { name = "opencode-v2"; }
            { name = "herdr"; }
        ];
        # All taps are pinned declaratively via nix-homebrew.taps (flake.nix).
        # Do NOT list homebrew/* here: brew bundle tries to untap paths it
        # can't manage -> Permission denied @ apply2files (nix-homebrew#128).
        taps = [ ];
           
        onActivation = {
            autoUpdate = true;
            cleanup = "uninstall";
            upgrade = true;
        };
        masApps = {
            # "Bitwarden" = 1352778147;
            # "AdGuard for Safari" = 1440147259;
        };

    };

    # Workaround for nix-homebrew ownership drift: activation rsyncs tap
    # contents as root without --chown (only the Taps/<namespace> dir gets
    # chowned), leaving root-owned files that block user-run brew from
    # writing .git (nix-homebrew#107/#128). nix-darwin's activate script is
    # a fixed template; postActivation runs last, after the `homebrew`
    # script (nix-homebrew rsync + brew bundle), so re-apply ownership there.
    system.activationScripts.postActivation.text = lib.mkAfter ''
        chown -R ${config.nix-homebrew.user}:${config.nix-homebrew.group} ${config.homebrew.prefix}/Library/Taps
        chmod -R ug+rwX ${config.homebrew.prefix}/Library/Taps
    '';
}

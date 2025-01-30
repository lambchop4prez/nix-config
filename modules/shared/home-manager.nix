{config, pkgs, lib, ...}:
let
    user = "tmc";
    gituser = "Tim";
    gitemail = "lambchop4prez@users.noreply.github.com";
in
{
    git = {
        enable = true;
        userEmail = gituser;
        userName = gitemail;
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "vim";
            pull.rebase = false;
            push.autoSetupRemote = true;
            fetch.prune = true;
        };
    };
}
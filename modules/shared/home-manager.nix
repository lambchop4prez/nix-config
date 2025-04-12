{config, pkgs, lib, ...}:
let
    user = "tmc";
    gituser = "Tim";
    gitemail = "lambchop4prez@users.noreply.github.com";
in
{
    direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };
    git = {
        enable = true;
        userEmail = gituser;
        userName = gitemail;
        ignores = [".DS_Store" "*.swp"];
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "vim";
            pull.rebase = false;
            push.autoSetupRemote = true;
            fetch.prune = true;
        };
    };
    zsh = {
        enable = true;
        initExtra = ''
            # Don't require escaping globbing characters in zsh.
            unsetopt nomatch
            alias gs='git status'
            alias gc='git commit'
            alias gp='git pull'
            autoload -Uz promptinit && promptinit && prompt pure
            export PATH="$PATH:/Users/${user}/.dotnet/tools"
            export DOTNET_ROOT="${pkgs.dotnet-sdk}/share/dotnet"
        '';
        antidote = {
            enable = true;
            package = pkgs.antidote;
            plugins = [
                "rupa/z"
                "mattmc3/zephyr path:plugins/completion"
                "romkatv/zsh-bench kind:path"
                "olets/zsh-abbr    kind:defer"
                "belak/zsh-utils path:editor"
                "belak/zsh-utils path:history"
                "belak/zsh-utils path:prompt"
                "belak/zsh-utils path:utility"
                "belak/zsh-utils path:completion"
                "sindresorhus/pure     kind:fpath"
                "mattmc3/zfunctions"
                "zsh-users/zsh-autosuggestions"
                "zdharma-continuum/fast-syntax-highlighting kind:defer"
                "zsh-users/zsh-history-substring-search"
            ];
        };
    };
}

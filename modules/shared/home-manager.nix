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
    # ghostty = {
    #     enable = true;
    #     enableZshIntegration = true;
    #     settings = {
    #         font-family = "IntoneMono NFM";
    #     };
    # };
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
            branch.sort = "-committerdate";
            tag.sort = "-version:refname";
            column.ui = "auto";
            maintenance.auto = true;
            maintenance.strategy = "incremental";
            core.compression = 9;
            commit.verbose = true;
        };
    };
    # vscode = {
    #     enable = true;
    #     profiles.default.userSettings = {
    #         # This property will be used to generate settings.json:
    #         # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
    #         "git.confirmSync" = false;
    #         "editor.formatOnSave" = true;
    #         "editor.fontLigatures" = true;
    #         "editor.fontFamily" = "IntoneMono Nerd Font Mono";
    #     };
    # };
    zsh = {
        enable = true;
        initContent = ''
            # Don't require escaping globbing characters in zsh.
            unsetopt nomatch
            alias gs='git status'
            alias gc='git commit'
            alias gp='git pull'
            
            export PATH="$PATH:/Users/${user}/.dotnet/tools"
            export DOTNET_ROOT="${pkgs.dotnet-sdk}/share/dotnet"
            # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
            # Initialization code that may require console input (password prompts, [y/n]
            # confirmations, etc.) must go above this block; everything else may go below.
            
            source ~/.p10k.zsh
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
                # "sindresorhus/pure     kind:fpath"
                "mattmc3/zfunctions"
                "zshzoo/macos conditional:is-macos"
                "zsh-users/zsh-autosuggestions"
                "zdharma-continuum/fast-syntax-highlighting kind:defer"
                "zsh-users/zsh-history-substring-search"
                "romkatv/powerlevel10k"
            ];
        };
    };
}

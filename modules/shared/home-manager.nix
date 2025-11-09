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

        ignores = [".DS_Store" "*.swp"];
        settings = {
          user = {
            name = gituser;
            email = gitemail;
          };
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
    neovim = {
        enable = true;
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
        plugins = [
            {
                name = "powerlevel10k-config";
                src = lib.cleanSource ./config;
                file = "p10k.zsh";
            }
        ];
        initContent = ''
            # Don't require escaping globbing characters in zsh.
            unsetopt nomatch
            alias gs='git status'
            alias gc='git commit'
            alias gp='git pull'

            export PATH="$PATH:/Users/${user}/.dotnet/tools"
            export DOTNET_ROOT="${pkgs.dotnet-sdk}/share/dotnet"
            if [[ -r "/Users/${user}/.cache/p10k-instant-prompt-${user}.zsh" ]]; then
                source "/Users/${user}/.cache/p10k-instant-prompt-${user}.zsh"
            fi
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

{ pkgs, config, ... }:
{
    ".p10k.zsh" = {
        text = builtins.readFile ./config/p10k.zsh;
    };
}
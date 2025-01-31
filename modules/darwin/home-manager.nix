{config, pkgs, lib, home-manager, ...}:
let
    user = "tmc";
in
{
    # imports = [
    #     ../shared/home-manager.nix
    # ];
    users.users.${user} = {
        name = "${user}";
        home = "/Users/${user}";
        isHidden = false;
        shell = pkgs.zsh;
    };
    
    home-manager = {
        useGlobalPkgs = true;
        users.${user} = {pkgs, config, lib, ...}:{
            home = {
                stateVersion = "24.11";
            };
            programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

        };
    };
}
{config, pkgs, lib, home-manager, ...}:
let
    user = "tmc";
in
{
    users.users.${user} = {
        name = "${user}";
        home = "/Users/${user}";
        isHidden = false;
        shell = pkgs.zsh;
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = {pkgs, config, lib, ...}:{
            home = {
                stateVersion = "24.11";
                packages = import ../shared/packages.nix { inherit config pkgs lib; };
            };
            programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };
            
        };
    };
}

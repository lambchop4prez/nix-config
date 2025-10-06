{user, pkgs, ...}:
let
    syncDir = 
        if pkgs.stdenv.isDarwin then
            "/Users/${user}"
        else
            "/home/${user}";
    configDir = "/Users/${user}/.config/syncthing";
in
{
    syncthing = {
        enabled = true;
        user = user;
        
    };
}
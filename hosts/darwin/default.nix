{ pkgs, self, ...}:
let
    user = "tmc";
in
{
    nix = {
        package = pkgs.nix;
        settings = {
            experimental-features = "nix-command flakes";
        };
    };
    system = {
        stateVersion = 5;
        configurationRevision = self.rev or self.dirtyRev or null;
        defaults = {
            LaunchServices = {
                LSQuarantine = false;
            };
            NSGlobalDomain = {
                AppleShowAllExtensions = true;
            };
            dock = {
                autohide = false;
                show-recents = false;
            };
            finder = {
                _FXShowPosixPathInTitle = true;
            };
        };
    };
    environment.systemPackages = with pkgs; (import ../../modules/shared/packages.nix { inherit pkgs; });

    
}
{ pkgs, self, ...}:
let
    user = "tmc";
in
{
    imports = [
        ../../modules/darwin/homebrew.nix
        ../../modules/darwin/home-manager.nix
    ];
    nix = {
        package = pkgs.nix;
        settings = {
            trusted-users = ["@admin" "${user}"];
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
                # AppleHighlightColor = "0.968627 0.831373 1.000000";
                AppleInterfaceStyle = "Dark";
                AppleShowScrollBars = "Always";
                NSAutomaticDashSubstitutionEnabled = false;
                NSAutomaticInlinePredictionEnabled = false;
                NSAutomaticQuoteSubstitutionEnabled = false;
                NSAutomaticSpellingCorrectionEnabled = false;
                NSDocumentSaveNewDocumentsToCloud = false;
                NSNavPanelExpandedStateForSaveMode = true;
                NSNavPanelExpandedStateForSaveMode2 = true;
                NSUseAnimatedFocusRing = false;
                PMPrintingExpandedStateForPrint = true;
                PMPrintingExpandedStateForPrint2 = true;
                "com.apple.keyboard.fnState" = true;
            };
            WindowManager = {  
                EnableStandardClickToShowDesktop = false;

            };
            dock = {
                autohide = false;
                orientation = "left";
                show-recents = false;

                wvous-tl-corner = 3; # Application Windows
                wvous-tr-corner = 12; # Notification Center
                wvous-bl-corner = 2; # All Windows
                wvous-br-corner =  4; # Desktop
            };
            finder = {
                _FXShowPosixPathInTitle = true;
                _FXSortFoldersFirst = true;
                FXDefaultSearchScope = "SCcf";
                FXEnableExtensionChangeWarning = false;
                FXPreferredViewStyle = "Nlsv";
                ShowStatusBar = true;
                ShowPathbar = true;

            };
        };
    };
    environment.systemPackages = with pkgs; (import ../../modules/shared/packages.nix { inherit pkgs; });

    
}
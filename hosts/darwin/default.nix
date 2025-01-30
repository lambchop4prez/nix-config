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
                show-recents = false;
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
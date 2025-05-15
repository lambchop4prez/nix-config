{ pkgs, self, ...}:
let
    user = "tmc";
in
{
    imports = [
        ../../modules/darwin/homebrew.nix
        ../../modules/darwin/home-manager.nix
        ../../modules/shared
    ];
    nix.enable = false;
    system = {
        stateVersion = 5;
        configurationRevision = self.rev or self.dirtyRev or null;
        defaults = {
            LaunchServices = {
                LSQuarantine = false;
            };
            NSGlobalDomain = {
                AppleFontSmoothing = 1;
                AppleKeyboardUIMode = 3;
                AppleShowAllExtensions = true;
                # AppleHighlightColor = "0.968627 0.831373 1.000000";
                AppleInterfaceStyle = "Dark";
                AppleShowScrollBars = "Always";
                NSAutomaticCapitalizationEnabled = false;
                NSAutomaticDashSubstitutionEnabled = false;
                NSAutomaticInlinePredictionEnabled = false;
                NSAutomaticPeriodSubstitutionEnabled = false;
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
                AppleShowAllExtensions = true;
                FXDefaultSearchScope = "SCcf";
                FXEnableExtensionChangeWarning = false;
                FXPreferredViewStyle = "Nlsv";
                ShowStatusBar = true;
                ShowPathbar = true;

            };
            CustomSystemPreferences = {
                "com.apple.Safari" = {
                    # Privacy: don’t send search queries to Apple
                    UniversalSearchEnabled = false;
                    # Press Tab to highlight each item on a web page
                    SuppressSearchSuggestions = true;
                    WebKitTabToLinksPreferenceKey = true;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks" = true;
                    # Show the full URL in the address bar (note: this still hides the scheme)
                    ShowFullURLInSmartSearchField = true;
                    # Set Safari’s home page to `about:blank` for faster loading
                    HomePage = "about:blank";
                    # Prevent Safari from opening ‘safe’ files automatically after downloading
                    AutoOpenSafeDownloads = false;
                    # Allow hitting the Backspace key to go to the previous page in history
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled" = true;
                    # Hide Safari’s bookmarks bar by default
                    ShowFavoritesBar = false;
                    # Hide Safari’s sidebar in Top Sites
                    ShowSidebarInTopSites = false;
                    # Disable Safari’s thumbnail cache for History and Top Sites
                    DebugSnapshotsUpdatePolicy = 2;
                    # Make Safari’s search banners default to Contains instead of Starts With
                    FindOnPageMatchesWordStartsOnly = false;
                    # Enable the Develop menu and the Web Inspector in Safari
                    IncludeDevelopMenu = true;
                    WebKitDeveloperExtrasEnabledPreferenceKey = true;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
                    # Add a context menu item for showing the Web Inspector in web views
                    WebKitDeveloperExtras = true;
                    # Enable continuous spellchecking
                    WebContinuousSpellCheckingEnabled = true;
                    # Disable auto-correct
                    WebAutomaticSpellingCorrectionEnabled = false;
                    # Disable AutoFill
                    AutoFillFromAddressBook = false;
                    AutoFillPasswords = false;
                    AutoFillCreditCardData = false;
                    AutoFillMiscellaneousForms = false;
                    # Warn about fraudulent websites
                    WarnAboutFraudulentWebsites = true;
                    # Disable plug-ins
                    WebKitPluginsEnabled = false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled" = false;
                    # Block pop-up windows
                    WebKitJavaScriptCanOpenWindowsAutomatically = false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically" = false;
                    # Enable “Do Not Track”
                    SendDoNotTrackHTTPHeader = true;
                    # Update extensions automatically
                    InstallExtensionUpdatesAutomatically = true;
                };
                "com.apple.mail" = {
                    AddressesIncludeNameOnPasteboard = false;
                    DisableInlineAttachmentViewing = true;
                };
            };
        };
    };



}

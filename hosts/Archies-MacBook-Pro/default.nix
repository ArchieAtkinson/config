{ pkgs, ... }:
{

    services.nix-daemon.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    
    users.users.aa = {
        name = "aa";
        home = "/Users/aa";
    };

    system.defaults = 
    {
        dock =
        {
            mineffect = "scale"; # Set the minimize/maximize window effect.
            show-recents = false; # Show recent applications in the dock.
            tilesize = 32; # Size of the icons in the dock.
            mru-spaces = false; # Whether to automatically rearrange spaces based on most recent use.
            autohide = true; # Whether to automatically hide and show the dock.
        };

        NSGlobalDomain = 
        {
            AppleMeasurementUnits = "Centimeters"; # Whether to use centimeters (metric) or inches (US, UK) as the measurement unit. 
            AppleShowAllExtensions = true; # Whether to show all file extensions in Finder.
        };

        finder = 
        {
            AppleShowAllFiles = true; # Whether to always show hidden files.
            FXPreferredViewStyle = "Nlsv"; # Change the default finder view. "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View.
            ShowPathbar = true; # Show path breadcrumbs in finder windows.
            ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats.
            _FXShowPosixPathInTitle = true; # Whether to show the full POSIX filepath in the window title.
        };

        loginwindow = 
        {
            GuestEnabled = false; # Allow users to login to the machine as guests using the Guest account.
            SHOWFULLNAME = true; # Displays login window as a name and password field instead of a list of users. 
        };

        menuExtraClock.IsAnalog = true; # Show an analog clock instead of a digital one. ( Using FuzzyClock instead )

        CustomUserPreferences = 
        {
            "NSGlobalDomain" = {"WebAutomaticTextReplacementEnabled" = false;}; # whether automatic user defined text replacement is enabled. ( Don't need for desktop )
        };
    };

    homebrew =
    {
        enable = true;
        onActivation.cleanup = "zap"; # Cleans up all formulae and cask when removed from nix-darwin
        casks =
        [
            "firefox"
            "dropbox"
            "fuzzyclock"
            "bluesnooze" # Prevents your sleeping Mac from connecting to Bluetooth accessories.
            "onedrive"
            "arc"
        ];
    };

    programs.zsh.enable = true;
}

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
            mineffect = "scale";
            show-recents = false;
            tilesize = 32;
        };

        NSGlobalDomain = 
        {
            AppleMeasurementUnits = "Centimeters";
            AppleShowAllExtensions = true;
        };

        finder = 
        {
            AppleShowAllFiles = true;
            FXPreferredViewStyle = "Nlsv";
            ShowPathbar = true;
            ShowStatusBar = true;
            _FXShowPosixPathInTitle = true;
        };

        loginwindow = 
        {
            GuestEnabled = false;
            SHOWFULLNAME = true;
        };

        CustomUserPreferences = 
        {
            "NSGlobalDomain" = {"WebAutomaticTextReplacementEnabled" = false;};
        };
    };

    homebrew =
    {
        enable = true;
        onActivation.cleanup = "zap";
        casks =
        [
            "firefox"
            "dropbox"
        ];
    };

    programs.zsh.enable = true;
}

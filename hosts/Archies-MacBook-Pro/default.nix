{ pkgs, ... }:
{

    services.nix-daemon.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    
    users.users.aa = {
        name = "aa";
        home = "/Users/aa";
    };

    system.defaults.dock = 
    {
        mineffect = "scale";
        show-recents = false;
        tilesize = 32;
    };

    homebrew =
    {
        enable = true;
        onActivation.cleanup = "zap";
        casks =
        [
            "firefox"
            "dropbox"
            "rectangle"
        ];
    };

    programs.zsh.enable = true;
}

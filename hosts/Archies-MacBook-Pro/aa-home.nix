{ config, pkgs, ... }:

{
    home.username = pkgs.lib.mkForce "aa";
    home.homeDirectory = pkgs.lib.mkForce "/User/aa";
    
    home.stateVersion = "22.11";

    programs.git = 
    {
        enable = true;
        includes = 
        [
            { 
                contents.user = 
                {
                email = "archieatkinson97@gmail.com";
                name = "Archie Atkinson";
                };
            }
        ];
    };

    programs.vscode = 
    {
        enable = true;
        package = pkgs.vscodium;
        userSettings = builtins.fromJSON (builtins.readFile ./../../settings.json); 
    };

    programs.neovim.enable = true;

    home.packages = 
    [
        pkgs.rectangle
        pkgs.obsidian
    ];

    home.file.rectangle_config = 
    {
        source = ./RectangleConfig.json;
        target = "/Library/Application Support/Rectangle/RectangleConfig.json";
        onChange = "rm -rf Library/'Application Support'/Rectangle/RectangleConfig20* || true";
        force = true;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}

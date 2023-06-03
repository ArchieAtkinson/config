{ config, pkgs, ... }:

{
    home.username = pkgs.lib.mkForce "aa";
    home.homeDirectory = pkgs.lib.mkForce "/User/aa";
    
    home.stateVersion = "23.05";

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
        userSettings = 
        {
            "window.autoDetectColorScheme" = true;
            "editor.fontSize" = 12;
            "files.autoSave" = "afterDelay";
            "editor.minimap.enabled" = false;
            "git.confirmSync" = false;
            "explorer.confirmDragAndDrop" = false;
        };
        extensions = with pkgs.vscode-extensions; 
        [
            yzhang.markdown-all-in-one
            bbenoist.nix
        ];
    };

    programs.neovim.enable = true;

    home.packages = 
    [
        pkgs.obsidian
        pkgs.rectangle
    ];

    home.file."rectangle/RectangleConfig.json" =
    {
        source = ./../../rectangle/RectangleConfig.json;
        target = "/Library/Application Support/Rectangle/RectangleConfig.json";
        onChange = "rm -rf Library/'Application Support'/Rectangle/RectangleConfig20* || true"; # Rectangle renames used conig files, this cleans them up
        force = true;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}

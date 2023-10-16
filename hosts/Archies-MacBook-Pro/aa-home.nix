{ config, pkgs, ... }:

{   
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

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    programs.zsh = 
    {
        enable = true;
        initExtra = ''
        export DIRENV_LOG_FORMAT=""
        '';
    };

    programs.vscode = 
    {
        enable = true;
        package = pkgs.vscode;
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

    home.packages = with pkgs;
    [
        obsidian
        raycast # Detects nix GUI apps 
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}

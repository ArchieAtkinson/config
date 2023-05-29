{
    description = "A very basic flake";
    
    inputs = 
    { 
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
        darwin.url = "github:lnl7/nix-darwin";
        darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, darwin }:
    {
   
        darwinConfigurations."Archies-MacBook-Pro" = darwin.lib.darwinSystem 
        {
            system = "x86_64-darwin";
            modules = 
            [
                ./hosts/Archies-MacBook-Pro/default.nix
                home-manager.darwinModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.aa = import ./hosts/Archies-MacBook-Pro/aa-home.nix;
                }
            ];
        };
    };
}

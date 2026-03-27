{
  description = "Kevin's Nixos Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim?rev=695b0b80f8452bc584adf23eb58bdc9f599e35eb";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs:
    let
      system = "x86_64-linux";

      # Helper Functions
      mkNixosConfig = hostname: username: desktop:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs desktop; };
          modules = [
            ./hosts/${hostname}

            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs desktop; };
                sharedModules = [ nixvim.homeModules.nixvim ];
                users.${username} = import ./home;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        beans-btw = mkNixosConfig "chromebook" "kevin" "qtile";
      };
    };
}

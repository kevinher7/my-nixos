{
  description = "NixOS from Scratch";

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

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs: {
    nixosConfigurations.beans-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kevin = import ./home.nix;
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [ nixvim.homeModules.nixvim ];
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}

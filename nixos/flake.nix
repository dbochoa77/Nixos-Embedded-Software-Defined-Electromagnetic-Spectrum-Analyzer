{
  description = "Configuration for Embedded Nixos"; 
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { 
    	disko,
	self, 
	home-manager,
	nixpkgs,
        nixpkgs-stable,
	  ...
  } @ inputs: let
    inherit (self) outputs;
    system = "aarch64-linux";
    pkgsStable = import nixpkgs-stable { inherit system; };
    systems = [ "aarch64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;  

  in {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	      specialArgs = {inherit inputs outputs;};
	      modules = [./hosts/nixos/default.nix
		               ./hosts/nixos/hardware-configuration.nix
                   disko.nixosModules.disko
	                ];
	    };
    };
    homeConfigurations = { 
      "nixos" = home-manager.lib.homeManagerConfiguration {
	      pkgs = nixpkgs.legacyPackages."aarch64-linux";
	      extraSpecialArgs = {inherit inputs outputs;};
	      modules = [./home/nixos/admin.nix];
	    };
    };
  };
}

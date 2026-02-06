{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
    ./configuration.nix
    ../admin
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
  ];
  
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.admin = 
    import ../../home/nixos/admin.nix; 
  }; 
}

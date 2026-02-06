{ config, pkgs, inputs, ... }: 

{ 
  home-manager.users.admin =
    import ../../../home/nixos/admin.nix;
 }

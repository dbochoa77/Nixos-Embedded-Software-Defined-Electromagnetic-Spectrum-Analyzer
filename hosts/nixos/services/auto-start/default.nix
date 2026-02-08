{ config, pkgs, lib, ... }: 

{ 
  services.getty.autologinUser = "admin";
}

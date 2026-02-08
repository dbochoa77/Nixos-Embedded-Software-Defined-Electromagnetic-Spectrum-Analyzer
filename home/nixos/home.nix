{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "admin";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  news.display = "silent";
  programs.home-manager.enable = false;

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

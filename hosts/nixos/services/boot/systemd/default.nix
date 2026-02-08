{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    };
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
}

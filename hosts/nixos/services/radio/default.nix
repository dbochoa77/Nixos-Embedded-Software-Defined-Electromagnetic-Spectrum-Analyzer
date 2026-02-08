{ pkgs, config, lib, ... }: 

{
  services.udev.packages = [ pkgs.rtl-sdr ];
}

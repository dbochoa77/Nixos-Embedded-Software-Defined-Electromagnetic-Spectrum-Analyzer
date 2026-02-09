{ config, pkgs, lib, ... }:

{
  boot.blacklistedKernelModules = [
    "dvb_usb_rtl28xxu"
    "rtl2832"
    "rtl2830"
  ];
}



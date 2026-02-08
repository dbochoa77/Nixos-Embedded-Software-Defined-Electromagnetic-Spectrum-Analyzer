#!/usr/bin/env bash

set -e

echo "[*] Partioning with Disko" 
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ~/nixos/hosts/nixos/disko-config.nix

echo "[*] Installing Nixos "
mkdir -p /mnt/Flakes/tmp 
sudo TMPDIR=/mnt/Flake/tmp nixos-install --flake .#nixos

echo "[*] Changing Repo Name to Nixos"
mv ~/Nixos-Embedded-Software-Defined-Electromagnetic-Spectrum-Analyzer ~/nixos

echo "[*] Moving hardware configuration"
sudo mv /etc/nixos/hardware-configuration.nix ~/nixos/hosts/nixos/

echo "[*] Backing up Legacy Location"
mkdir -p ~/legacy-nixos
sudo mv /etc/nixos/ ~/legacy-nixos

echo "[*] Removing Nixos Legacy Dir"
sudo rm -fr /etc/nixos

echo "[*] Updating Nixos Flake Channel..."
nix flake update 

echo "[*] Rebuilding NixOS system..."
sudo nixos-rebuild switch --flake .#nixos

echo "[*] Updating Home Manager configuration..."
home-manager switch --flake .#nixos

echo "[*] Removing Bootstrap.sh, Thank you !!"
rm ~/nixos/bootstrap.sh


#!/usr/bin/env bash

set -e

echo "[*] Partioning with Disko" 
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ~/Homelab/nixosBase/disk-config.nix

echo "[*] Cleaning system for Nixos Installation" 
sudo nix-collect-garbage -d && sudo nix store gc --extra-experimental-features "nix-command" && sudo nix store optimise

echo "[*] Installing Nixos "
mkdir -p /mnt/Flakes/tmp 
cd  ~/Homelab/nixosBase
sudo TMPDIR = /mnt/Flake/tmp nixos-install --flake .#nixos

echo "[*] Changing Repo Name to Nixos"
mv /home/dbochoa77/nixosConfiguration /home/dbochoa77/nixos

echo "[*] Moving hardware configuration"
sudo mv /etc/nixos/hardware-configuration.nix ~/nixos/hosts/

echo "[*] Backing up Legacy Location"
mkdir -p ~/legacy-nixos
sudo mv /etc/nixos/ ~/nixos/legacy-nixos

echo "[*] Setting up nvim"
sudo mkdir ~/.config
mv ~/nixos/nvim ~/.config/

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

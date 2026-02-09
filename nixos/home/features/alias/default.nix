{ config, lib, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # Basic Commands
      c = "clear";
      h = "history";
      now = "date +%T";
      grep = "rg";
      ps = "procs";
      top = "htop";
      df = "df -h";
      du = "du -sh";
      t = "tree -L 2";

      # File Listing
      ls = "eza -a --icons --git";
      la = "exa -la --icons --git";
      lt = "eza -T --git-ignore --icons";

      # Directory Movement
      mkdir = "mkdir -p";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../..";
      ".4" = "cd ../../../../";
      ".5" = "cd ../../../../../";

      # Git Shortcuts
      ga = "git add .";
      gc = "git commit -";
      gs = "git status";
 
      # Nix Config Rebuild
      rebuild = "nix flake update && sudo nixos-rebuild switch --flake ~/nixos#nixos && home-manager switch --flake ~/nixos#nixos"; 

      # Neovim (root)
      v = "sudo -E nvim";
    };

    initExtra = ''
      cd() {
        builtin cd "$@" && eza -a --icons --git;
      }

      fastfetch
      ls -d -- * .*
    '';
  };
}


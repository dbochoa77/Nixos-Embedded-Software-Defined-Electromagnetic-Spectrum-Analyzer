{ config, ... }: 

{ 
  imports = [ 
    ../admin
    ../features
    ./home.nix
    ./dotfiles
  ]; 

  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}


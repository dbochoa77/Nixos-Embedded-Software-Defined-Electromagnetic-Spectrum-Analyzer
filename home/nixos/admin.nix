{ config, ... }: 

{ 
  imports = [ 
    ../admin
    ../features
    ./home.nix
  ]; 
}


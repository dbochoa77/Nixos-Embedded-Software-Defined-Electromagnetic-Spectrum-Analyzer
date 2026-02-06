{ pkgs }:

{
  systemPackages = import ./systemPackages { inherit pkgs; };
}



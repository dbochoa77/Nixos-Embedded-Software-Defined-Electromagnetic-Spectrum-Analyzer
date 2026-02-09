{ pkgs }:

( import ./admin { inherit pkgs; } )
++
( import ./base { inherit pkgs; } )
++
( import ./hardware { inherit pkgs; } )
++
( import ./networking { inherit pkgs; } )
++
( import ./nixos-admin { inherit pkgs; } )
++
( import ./security { inherit pkgs; } )
++
( import ./storage { inherit pkgs; } )
++ 
( import ./radio { inherit pkgs; } )


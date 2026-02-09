{ config, pkgs, lib, ... }:

{
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
  	if [ -z "$TMUX" ] && command -v tmux >/dev/null; then
  	  tmux attach -t main || tmux new -s main
	fi
  '';
}


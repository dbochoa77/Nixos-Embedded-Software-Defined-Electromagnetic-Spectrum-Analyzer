{ config, pkgs, lib, ... }:

{
  programs.bash.interactiveShellInit = ''
    if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && command -v tmux >/dev/null; then
      tmux attach -t main || tmux new -s main
    fi
  '';
}


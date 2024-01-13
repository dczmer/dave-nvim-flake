{ pkgs }:
let
  deps = with pkgs; [
    fzf
    powerline-fonts
    silver-searcher
    nodejs
  ];
in
  deps

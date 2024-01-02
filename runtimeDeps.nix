{ pkgs }:
let
    deps = with pkgs; [
        powerline-fonts
        silver-searcher
    ];
in
    deps

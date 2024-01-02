{ pkgs }:
let
    deps = with pkgs; [
        fzf
        powerline-fonts
        silver-searcher
        nodejs
        pyright
    ];
in
    deps

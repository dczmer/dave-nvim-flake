{ pkgs }:
let
    snippetsDir = pkgs.stdenv.mkDerivation {
        name = "nvim-snippets";
        src = ./snippets;
        installPhase = ''
            mkdir -p $out/snippets
            cp ./* $out/snippets
        '';
    };
in
    snippetsDir

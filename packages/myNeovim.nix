{ pkgs }:
let
    customRC = import ../config { inherit pkgs; };
    plugins = import ../plugins.nix { inherit pkgs; };
    runtimeInputs = import ../runtimeDeps.nix { inherit pkgs; };
    myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
        configure = {
            inherit customRC;
            packages.all.start = plugins;
        };
    };
in
    pkgs.writeShellApplication {
        name = "nvim";
        inherit (runtimeDeps);
        text = ''
        ${myNeovimUnwrapped}/bin/nvim "$@"
        '';
    }

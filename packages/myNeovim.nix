{ pkgs }:
let
  plugins = import ../plugins.nix { inherit pkgs; };
  customRC = import ../config { inherit pkgs; };
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
    inherit runtimeInputs;
    text = ''
        ${myNeovimUnwrapped}/bin/nvim "$@"
    '';
  }

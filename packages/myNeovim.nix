{ pkgs }:
let
    customRC = import ../config { inherit pkgs; };
    plugins = import ../plugins.nix { inherit pkgs; };
    snippets = import ../snippets { inherit pkgs; };
    runtimeInputs = import ../runtimeDeps.nix { inherit pkgs; };
    myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
        configure = {
            inherit customRC;
            packages.all.start = plugins;
        };
    };
in
    # TODO: somehow write the location of the snippets dir into vimrc for coc
    # snippets.ultisnips.directories = ["${snippets}/snippets"]
    # could pass this as an argument to the config script
    pkgs.writeShellApplication {
        name = "nvim";
        runtimeInputs = runtimeInputs ++ [ snippets ];
        text = ''
        ${myNeovimUnwrapped}/bin/nvim "$@"
        '';
    }

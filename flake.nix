# NOTES:
# - nix flake check
# - nix build
# - nix flake show
# - nix flake update
# - nix run
# - `builtins.trace e1 e2` print e1 and return e2. put a debug print in front of an expression.
# - nix repl
#   > :l <nixpkgs>
#   > x = import x.nix { pkgs=pkgs }
#   > :b import x.nix { pkgs=pkgs }
{
    description = "General purpose neovim flake";
    inputs = {
        nixpkgs = { url = "github:NixOS/nixpkgs"; };
        neovim = {
            # TODO: i think `dir=contrib` is giving the dev branch?
            url = "github:neovim/neovim/stable?dir=contrib";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        vim-plugin-AnsiEsc-src = {
            url = "github:powerman/vim-plugin-AnsiEsc";
            flake = false;
        };
    };
    outputs = { self, nixpkgs, neovim, vim-plugin-AnsiEsc-src }:
    let
        # override `pkgs.neovim` from flake inputs
        overlayFlakeInputs = prev: final: {
            neovim = neovim.packages.x86_64-linux.neovim;
            vimPlugins = final.vimPlugins // {
                vim-plugin-AnsiEsc = import ./packages/vimPlugins/vim-plugin-AnsiEsc.nix {
                    src = vim-plugin-AnsiEsc-src;
                    pkgs = prev;
                };
            };
        };
        # add `pkgs.myNeovim` with my customized version
        # this will reference the overridden `neovim` from above
        overlayMyNeovim = prev: final: {
            myNeovim = import ./packages/myNeovim.nix {
                pkgs = final;
            };
        };
        pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ overlayFlakeInputs overlayMyNeovim ];
        };
    in {
        # this installs the 'package' for this flake
        packages.x86_64-linux.default = pkgs.myNeovim;
        # produce an 'app' for this platform that we can execute with `nix run`
        apps.x86_64-linux.default = {
            type = "app";
            program = "${pkgs.myNeovim}/bin/nvim";
        };
    };
}

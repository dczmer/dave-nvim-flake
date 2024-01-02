{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
    name = "vim-afterglow-source";
    inherit src;
}

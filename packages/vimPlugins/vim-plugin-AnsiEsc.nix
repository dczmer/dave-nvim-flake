{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
    name = "vim-plugin-AnsiEsc-src";
    inherit src;
}

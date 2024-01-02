# Generic / General-Purpose NeoVim Flake

General purpose neovim install.

- Includes plugins and configuration for things I do commonly, but leaves out expensive plugins, config, and dependencies for things I don't work with very often.
- Ideally, I'll be able to add my flake as an input to a devenv project and configure what type of development env it should use for that project.
- So a typescript project might include this flake and set the option `myNeovim.typescript.enabled = true;` to add coc-typescript, node, etc. needed for the plugins.
- Instead of bundling custom snippets with this flake, it includes vim-snippets and is configured to look for custom snippets in ~/.vim/ultiSnips.

Copying https://primamateria.github.io/blog/neovim-nix/ as a starting point.

Still learning about nix and flakes and what is possible, but getting some cool ideas:
- Multiple derivations of this flake that swap out config and plugins (and runtime deps) based on project (build args)
- create overridable options to control what plugins/config/deps get installed
- create a nix module so i can use it in home-manager and devenv like `myNeovim.option = whatever;` to control the vim env in my flake


# TODO:
- [ ] use latest stable build instead of dev (or optionally dev)
- [ ] manage/merge coc config ~/.config/coc with this flake
- [ ] setup python flavor (optional runtime deps and additional plugins)
- [ ] build a module to pull together all of the custom plugins into one attr list, then splice those into pkgs overlay (instead of importing each file)

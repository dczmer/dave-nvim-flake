# Generic / General-Purpose NeoVim Flake

General purpose neovim install.
Includes plugins and configuration for things I do commonly, but leaves out expensive plugins, config, and dependencies for things I don't work with very often.
Ideally, I'll be able to add my flake as an input to a devenv project and configure what type of development env it should use for that project.
So a typescript project might include this flake and set the option `myNeovim.typescript.enabled = true;` to add coc-typescript, node, etc. needed for the plugins.

Copying https://primamateria.github.io/blog/neovim-nix/ as a starting point.

Still learning about nix and flakes and what is possible, but getting some cool ideas:
- Multiple derivations of this flake that swap out config and plugins (and runtime deps) based on project (build args)
- create overridable options to control what plugins/config/deps get installed
- create a nix module so i can use it in home-manager and devenv like `myNeovim.option = whatever;` to control the vim env in my flake


# TODO:
- [ ] setup snippets (copy/link dir, set coc options, test)
- [ ] setup/combine with vim-snippets
- [ ] use latest stable instead of dev (or optionally dev)
- [ ] manage/merge coc config ~/.config/coc with this flake
- [ ] setup python flavor (runtime deps and additional plugins)
- [ ] look at neovim package options...
- [ ] test all of these commands with python+pyright, then disable them from the base configuration

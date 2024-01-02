{ pkgs }:
with pkgs.vimPlugins; [
    camelcasemotion
    fugitive
    vim-markdown
    vim-markdown-composer
    ag-nvim
    vim-airline
    vim-airline-themes
    vim-tmux-navigator
    vim-nix
    nvim-surround
    tagbar
    fzfWrapper
    vim-plugin-AnsiEsc
    ctrlp-vim
    coc-nvim
    coc-snippets
    vim-snippets
    coc-fzf
    coc-git
    coc-json
    coc-toml
    coc-yaml

    # python specific
    # (requires autopep8, rope, pyright, ...)
    # - coc-pyright

    # webdev
    # (requires npm and a billion other dependencies that slow vim down)
    # - vim-javascript
    # - typescript-vim
    # - vim-jsx-pretty
    # - vim-jsx-typescript
    # - sparkup
    # - tagalong-vim
]

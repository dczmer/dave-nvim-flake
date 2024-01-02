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

    # TODO: vim-afterglow
    #fzf
    #ctrlp
    #nvim-surround
    #fastfold
    #tagbar
    #tagalong-vim
    #splice-vim
    
    # TODO: coc - can i configure the extensions declaratively? i guess i don't need to it can be done per-project as needed

    # TODO snippets? coc?:
    #   ultisnips
    #   vim-snippets

    # python specific
    # - pytag
    # - vim-coiled-snake
    # 

    # webdev
    # - vim-javascript
    # - typescript-vim
    # - vim-jsx-pretty
    # - vim-jsx-typescript
    # - sparkup
]

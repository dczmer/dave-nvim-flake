function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

"" use tab/s-tab to cycle through suggestions
"" XXX original version
"inoremap <silent><expr> <tab>
"    \ coc#pum#visible() ? coc#pum#next(1) :
"    \ CheckBackspace() ? "\<tab>" :
"    \ coc#refresh()
"" XXX snippet version (doesn't tab to next suggestion):
"inoremap <silent><expr> <tab>
"    \ coc#pum#visible() ? coc#_select_confirm() :
"    \ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippet-expand-jump',''])\<CR>" :
"    \ CheckBackspace() ? "\<tab>" :
"    \ coc#refresh()
"" TODO: this seems to work?
inoremap <silent><expr> <tab>
    \ coc#pum#visible() ? 
    \   coc#expandableOrJumpable() ?
    \       "\<c-r>=coc#rpc#request('doKeymap', ['snippet-expand-jump',''])\<CR>" :
    \       coc#pum#next(1) :
    \   CheckBackspace() ? "\<tab>" :
    \ coc#refresh()
inoremap <silent><expr> <s-tab>
    \ coc#pum#visible() ? coc#pum_prev(1) : "\<C-h>" 

" use CR to accept selected
inoremap <silent><expr> <cr>
    \ coc#pum#visible() ?
    \ coc#pum#confirm() :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use c-space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use `[g` and `]g` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gV <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview mode
noremap <silent> K :call ShowDocumentation()<CR>

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" apply code actions to selected code block
" example: `<leader>aap` for the current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" remap keys for applying code actions at the cursor position
nmap <leader>ac <Plug>(coc-codeaction-cursor)
" applying code actions for the whole buffer
nmap <leader>as <Plug>(coc-codeaction-source)
" apply most preferred quick-fix action to fix diagnostic on current line
nmap <leader>qf <Plug>(coc-fix-current)

" XXX i don't trust refactor tools...
" this requires a refactoring tool, like rope (which needs to be pip-installed in project)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r <Plug>(coc-codeaction-refactor-selected)

" run code lens action on current line
nmap <leader>cl <Plug>(coc-codelens-action)

" map function and class text objects
" NOTE: requires 'textDocument.documentSymbol' support from language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" remap <c-f> and <c-b> to scroll float/popop windows
nnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-f>"
inoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" use c-s for selection ranges
" Requires 'textDocument/selectionRange' support from language server
nmap <silent> <c-s> <Plug>(coc-range-select)
xmap <silent> <c-s> <Plug>(coc-range-select)

" add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync("format")

" use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` to organize imports in current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

"" TODO: these don't work :(
"" Mappings for CocList
"" show all diagnostics
"noremap <silent><nowait> <space>a <C-u>CocList diagnostics<cr>
"" manage extensions
"noremap <silent><nowait> <space>e <c-u>CocList extensions<cr>
"" show commands
"noremap <silent><nowait> <space>c <c-u>CocList commands<cr>
"" find symbol in current document
"noremap <silent><nowait> <space>o <c-u>CocList outline<cr>
"" search workspace symbols
"noremap <silent><nowait> <space>s <c-u>CocList -I symbols<cr>
"" do default action for next item
"noremap <silent><nowait> <space>j <c-u>CocNext<cr>
"" do default action for prev item
"noremap <silent><nowait> <space>k <c-u>CocPrev<cr>
"" resume latest coc list
"noremap <silent><nowait> <space>p <c-u>CocListResume<cr>

" snippets
let g:coc_snippet_next = '<tab>'

"" TODO: not sure if i need these, if the tab-select works?
"" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)
"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)
"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'
"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'
"" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
"" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)

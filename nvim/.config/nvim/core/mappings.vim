" " Move the cursor based on physical lines, not the actual lines.
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap ^ g^
" nnoremap 0 g0

" " When completion menu is shown, use <cr> to select an item and do not add an
" " annoying newline. Otherwise, <enter> is what it is. For more info , see
" " https://superuser.com/a/941082/736190 and
" " https://unix.stackexchange.com/q/162528/221410
" " inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" " Use <esc> to close auto-completion menu
" " inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" " Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
" "inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" "inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" " Edit and reload init.vim quickly
" " nnoremap <silent> <leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
" " nnoremap <silent> <leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
" "       \ call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

" " Always use very magic mode for searching
" nnoremap / /\v

" " Search in selected region
" xnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" " Find and replace (like Sublime Text 3)
" nnoremap <C-H> :%s/
" xnoremap <C-H> :s/

" " Change current working directory locally and print cwd after that,
" " see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>

" " Use Esc to quit builtin terminal
" tnoremap <ESC>   <C-\><C-n>

" " Toggle spell checking (autosave does not play well with z=, so we disable it
" " when we are doing spell checking)
" nnoremap <silent> <F11> :<C-U>set spell!<cr>
" inoremap <silent> <F11> <C-O>:<C-U>set spell!<cr>

" " Change text without putting it into the vim register,
" " see https://stackoverflow.com/q/54255/6064933
" nnoremap c "_c
" nnoremap C "_C
" nnoremap cc "_cc
" xnoremap c "_c

" " Remove trailing whitespace characters
" nnoremap <silent> <leader><Space> :<C-U>StripTrailingWhitespace<CR>

" " check the syntax group of current cursor position
" nnoremap <silent> <leader>st :<C-U>call utils#SynGroup()<CR>

" " Clear highlighting
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

" " Copy entire buffer.
" nnoremap <silent> <leader>y :<C-U>%y<CR>

" " Toggle cursor column
" nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>

" " Move current line up and down
" nnoremap <silent> <A-k> <Cmd>call utils#SwitchLine(line('.'), 'up')<CR>
" nnoremap <silent> <A-j> <Cmd>call utils#SwitchLine(line('.'), 'down')<CR>

" " Move current visual-line selection up and down
" xnoremap <silent> <A-k> :<C-U>call utils#MoveSelection('up')<CR>
" xnoremap <silent> <A-j> :<C-U>call utils#MoveSelection('down')<CR>

" " Replace visual selection with text in register, but not contaminate the
" " register, see also https://stackoverflow.com/q/10723700/6064933.
" xnoremap p "_c<ESC>p

" nnoremap <silent> gb :<C-U>call buf_utils#GoToBuffer(v:count, 'forward')<CR>
" nnoremap <silent> gB :<C-U>call buf_utils#GoToBuffer(v:count, 'backward')<CR>

" nnoremap <Left> <C-W>h
" nnoremap <Right> <C-W>l
" nnoremap <Up> <C-W>k
" nnoremap <Down> <C-W>j

" " Text objects for URL
" xnoremap <silent> iu :<C-U>call text_obj#URL()<CR>
" onoremap <silent> iu :<C-U>call text_obj#URL()<CR>

" " Text objects for entire buffer
" xnoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>
" onoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>

" " Do not move my cursor when joining lines.
" nnoremap J mzJ`z

" " Break inserted text into smaller undo units.
" for ch in [',', '.', '!', '?', ';', ':']
"   execute printf('inoremap %s %s<C-g>u', ch, ch)
" endfor

" " insert semicolon in the end
" inoremap <A-;> <ESC>miA;<ESC>`ii

" " Keep cursor position after yanking
" nnoremap y myy
" xnoremap y myy

" augroup restore_after_yank
"   autocmd!
"   autocmd TextYankPost *  call s:restore_cursor()
" augroup END

" function! s:restore_cursor() abort
"   silent! normal `y
"   silent! delmarks y
" endfunction

" for mappings defined in lua
lua require('custom-map')

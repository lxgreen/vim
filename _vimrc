set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
  if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" === MY SETTINGS === "
" Set UTF-8 encoding. Depends on DejaVu San Mono font.
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=DejaVu\ Sans\ Mono:h11
set guifontwide=Consolas:h11

" Molokai theme
colorscheme molokai

" Line numbers on
set number

" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:‣\ ,eol:¬
nmap <leader>l :set list!<CR>
 
" http://vimcasts.org/episodes/tabs-and-spaces/
set ts=4 sts=4 sw=4 expandtab

" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>CleanUpEmptySpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    %s#\($\n\s*\)\+\%$##
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>CleanUpEmptySpace()<CR>
autocmd BufWritePre *.* :call <SID>CleanUpEmptySpace()

" http://vimcasts.org/episodes/indentation-commands/
nmap <S-Tab> <<
nmap <Tab> >>
vmap <S-Tab> <gv
vmap <Tab> >gv

" plugin mappings
nmap <silent> <leader>d :NERDTree d:\<CR>
nmap <silent> <leader>c :NERDTree c:\<CR>

nmap <silent> <leader>t :TlistToggle<CR>

" http://vimcasts.org/episodes/working-with-windows/
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-H> <C-w>H
map <C-J> <C-w>J
map <C-K> <C-w>K
map <C-r> <C-w>r
map <C-x> <C-w>x

" http://vimcasts.org/episodes/working-with-tabs/ 
map <C-Left> gt
map <C-Right> gT

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
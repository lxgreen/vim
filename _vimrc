set shell=cmd
set shellcmdflag=/c
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Bundles
filetype off   
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc("$VIM/vimfiles/bundle")
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/emmet-vim'
Bundle 'elentok/plaintasks.vim'
Bundle 'taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/DrawIt'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/DrawIt'
Bundle 'godlygeek/tabular'
Bundle 'tomasr/molokai'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'honza/vim-snippets'
Bundle "garbas/vim-snipmate"
Bundle "Valloric/YouCompleteMe"
Bundle "nathanaelkane/vim-indent-guides"
Bundle 'vim-scripts/camelcasemotion'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

" === MY SETTINGS === "
" Set UTF-8 encoding. Depends on DejaVu San Mono font.
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=DejaVu\ Sans\ Mono:h11
set guifontwide=Consolas:h11

let $TMP="C:/tmp"
let $PRJ="D:/Projects"

cd $PRJ

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
    %s:\($\n\s*\)\+\%$::e
    call cursor(l, c)
endfunction
autocmd BufWritePre *.* :call <SID>CleanUpEmptySpace()

" http://vimcasts.org/episodes/indentation-commands/
nmap <S-Tab> <<
nmap <Tab> >>
vmap <S-Tab> <gv
vmap <Tab> >gv


filetype plugin indent on
" NERDTree mappings
nmap <silent> ,d :NERDTree d:\<CR>
nmap <silent> ,c :NERDTree c:\<CR>

" taglist mappings
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

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" http://vimcasts.org/episodes/spell-checking/
au BufRead *.txt,*.md,*.todo,*.task setlocal spell
nmap <silent> <leader>s :set spell!<CR>

if has("autocmd")
  autocmd bufwritepost _vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
if exists(":Tabularize")
  nmap <Leader>== :Tabularize /=<CR>
  vmap <Leader>== :Tabularize /=<CR>
  nmap <Leader>=: :Tabularize /:\zs<CR>
  vmap <Leader>=: :Tabularize /:\zs<CR>
endif

" http://vimcasts.org/episodes/undo-branching-and-gundo-vim/
" depends on Python for Windows (cygwin is insufficient)
nnoremap <Leader>u :GundoToggle<CR>

" fugitive commands abbreviations
cab ga Git add
cab gb Gblame
cab gc Gcommit -m
cab gs Gstatus
cab gp Git push
cab gd Gdiff
cab gco Git clone

" keep folds between sessions
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" TODO shortcut
cab tbd tabe $VIM/vim.todo<CR>

" NERDComment + snipmate support
filetype plugin on

" snipMate autocomplete on Tab (cancel YCM navigation on Tab)
 let g:ycm_key_list_select_completion = ['<Down>']

" preview in browser
map <silent><F12> :!"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %<CR>
nmap <silent> <leader>w :set wrap!<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

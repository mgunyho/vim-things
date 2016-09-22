set nu
set rnu
set showcmd
set hlsearch
set wrap
set linebreak
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set autoindent
"set expandtab
set noexpandtab
set visualbell
set t_vb=
set modeline
set encoding=utf-8
set incsearch "Start searching before pressing enter (see also: sensible-vim)
set timeoutlen=1000 ttimeoutlen=0
set foldcolumn=1
set scrolloff=5
set display=lastline " display long lines at the bottom partially, instead of '@' symbols.
set splitbelow " open splits below the current one
set splitright " open vsplits to the right of the current one
set wildmode=longest,list,full " bash-like autocompletion for commands
set wildmenu
set foldopen-=search " do not open folds if there's a match inside them
set autochdir " automatically set working directory to path of open file.
" actually cd to the current file (the above is only applied upon changing file)
cd %:p:h

" turn off rnu when in insert mode
au FocusLost * :set nornu 
au FocusGained * :set rnu "TODO: fix the delay on this...
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu 


""""""""""""
" MAPPINGS "
""""""""""""

map <F7> :tabp <CR>
map <C-F7> :tabm -<CR>
map <F8> :tabn <CR>
map <C-F8> :tabm +<CR>

" use alt + hjkl to navigate windows
" (doesn't work always e.g. in tmux)
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" fixing some unutilized parts of the scandinavian keyboard (TODO: make this depend on keyboard layout?)
nnoremap å ^
vnoremap å ^
nnoremap gå g^
nnoremap ¤ $
nnoremap g¤ g$
" switch , and ; to be consistent with n vs N, f vs F etc (on the Finnish  keybaord at least).
" TODO: swap these based on if the previous command was f/F or t/T
nnoremap , ;
nnoremap ; ,

" map ctrl-h to remove search highlight, shouldn't conflict with anything.
nnoremap <silent> <C-h> :noh<CR>

" swap around the mappings of w, b and e to make E mappable to ge to be consistent with the above
" TODO: is this a good idea? - needs a fourth key to work completely..
" nnoremap E ge
" nnoremap <silent> W :normal! b<CR>
" nnoremap <silent> b :normal! W<CR>
" nnoremap <silent> B :normal! B<CR>

" map non-breaking space to actual space
inoremap   <Space>

" nnoremap Y y$ TODO: figure this out, this breaks 'yy'

" '*' on a visual selection searches for it (similar to normal mode*)
vnoremap * y/<C-R>"<CR>
" make n and N behave the same way regardless of whether * or # is used.
nnoremap # *NN
vnoremap # y/<C-R>"<CR>NN

" 'gd' with a capital D opens definition in new (small) split, to get a peak
nnoremap gD :10sp<CR> gd

" Map C-space to autocompletion
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    "inoremap <C-Space> <C-n>
    "http://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently
    "inoremap <C-S-Space> <C-p>
    inoremap <C-Space> <C-p>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
    "inoremap <S-Nul> <C-p> ??? 
  endif
endif

" pressing enter when the autocomplete menu is open just selects the option.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" pressing esc when the autocomplete menu is open leaves the current option in place and exits insert mode
"TODO, this doesn't work. it inputs pumvisible instead of calling the function...
"inoremap <expr> <ESC> pumvisible() ? "\<C-y><ESC>" : "\<C-g>u\<ESC>"

"TODO: filetype plugin for directories (filetype = 'netwr' or sth), which maps
"keys to search like in file browsers, and alt-j to down and alt-h to up etc.
"'for x in abcdefghijlkmnopqrstuwvxyz: nnoremap <buffer> $x /$x'

"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plugged')
 Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']} " TODO: for plaintex as well (?)
 "TODO: surround.vim
 "Plug 'https://github.com/tpope/vim-surround.git'
call plug#end() "


"""""""""""""""""""""""""""""""""""
" SETTINGS SPECIFIC TO FILE TYPES "
"""""""""""""""""""""""""""""""""""

" TODO: figure out what 'indent' and 'plugin' mean...
filetype indent plugin on

" LaTeX specific options
" see also: ftplugin/tex.vim
let g:tex_flavor = "latex"
let g:tex_comment_nospell = 1

"TODO: make this only for tex files.
let g:AutoClosePairs_add = "$"

" don't expand spaces after auto-closing brackets. Needed to make
" abbreviations work.
let g:AutoCloseExpandSpace = 0

" Set up colos for folding
hi FoldColumn ctermbg=none ctermfg=cyan
hi Folded ctermbg=none ctermfg=cyan

" Abbreviations are defined in a separate file. NOTE: disabled
" 'AutoCloseExpandSpace' from AutoClose.vim.
source ~/.vim/abbrev.vim

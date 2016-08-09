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
set autochdir " automatically set working directory to path of open file.
set splitbelow " open splits below the current one

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

" fixing some unutilized parts of the scandinavian keyboard (TODO: make this depend on keyboard layout?)
map å ^
map ¤ $

" nnoremap Y y$ TODO: figure this out, this breaks 'yy'

" '/' on a visual selection searches for it (similar to *)
vnoremap / y/<C-R>"<CR>

" Map C-space to autocompletion
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
    "http://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently
    "inoremap <C-S-Space> <C-p>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
    "inoremap <S-Nul> <C-p> ??? 
  endif
endif

" pressing enter when the autocomplete menu is open just selects the option.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plugged')
 Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']} " TODO: for plaintex as well (?)
call plug#end() "


"""""""""""""""""""""""""""""""""""
" SETTINGS SPECIFIC TO FILE TYPES "
"""""""""""""""""""""""""""""""""""

" TODO: figure out what 'indent' and 'plugin' mean...
filetype indent plugin on

" LaTeX specifig options
" see also: ftplugin/tex.vim
let g:tex_flavor = "latex"

" Set up colos for folding
hi FoldColumn ctermbg=none ctermfg=cyan
hi Folded ctermbg=none ctermfg=cyan

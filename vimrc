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

" turn off rnu when in insert mode
au FocusLost * :set nornu 
au FocusGained * :set rnu "TODO: fix the delay on this...
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu 

""""""""""""
" MAPPINGS "
""""""""""""

map <F7> :tabp <CR>
map <F8> :tabn <CR>
nmap <C-h> :nohl<CR>
" fixing some unutilized parts of the scandinavian keyboard (TODO: make this depend on keyboard layout?)
map å ^
map ¤ $
" nnoremap Y y$ TODO: figure this out, this breaks 'yy'

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


call plug#begin('~/.vim/plugged')
 Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']} " TODO: for plaintex as well (?)
call plug#end() "

"autocmd BufNewFile,BufRead *.html source ~/.vim/ftplugin/

" TODO: figure out which of these two to use...
filetype indent plugin on
"filetype plugin on

" this is already done by filetype indent plugin on i think?
"autocmd FiletType python setlocal expandtab smarttab shiftwidth=2 tabstop=2

" LaTeX specifig bindings (TODO: move to .vim/after/filetype/tex.vim ?)
" TODO: fix for windows
source $HOME/.vim/tex-bindings.vim

" Set up colos for folding
hi FoldColumn ctermbg=none ctermfg=cyan

hi FoldColumn guibg=none guifg=cyan
hi Folded ctermbg=black ctermfg=cyan
hi Folded guibg=black guifg=cyan

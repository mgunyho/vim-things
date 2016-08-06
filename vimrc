set nu
set rnu
set showcmd
set hlsearch
set wrap
set linebreak
set ignorecase smartcase
set tabstop=4
"set expandtab
set visualbell
set autoindent
set t_vb=
set incsearch "Start searching before pressing enter (see also: sensible-vim)
set foldcolumn=1
set autochdir
set scrolloff=5

filetype indent plugin on
"autocmd FiletType python setlocal expandtab smarttab shiftwidth=2 tabstop=2

" LaTeX specifig bindings (TODO: move to own file?)
" TODO: fix for windows
source $HOME/.vim/tex-bindings.vim

"TODO: only one 'autocmd filetype tex ... '
"autocmd Filetype tex,latex,plaintex source './tex-bindings' 

" move down wrapped rows with k and j in tex files
"autocmd Filetype tex,latex,plaintex nnoremap <buffer> j gj
"autocmd Filetype tex,latex,plaintex inoremap <buffer> <C-b> \textbf{}i
""TODO: this overrides <Tab> in insert mode, fix that
"autocmd Filetype tex,latex,plaintex inoremap <buffer> <C-i> \emph{}i
"autocmd Filetype tex,latex,plaintex inoremap <buffer> <C-f> \frac{}{}F}i
"
""TODO: dollar sign things, see http://stackoverflow.com/a/35042848/5208725
"autocmd Filetype tex,latex,plaintex onoremap <buffer> <silent> i$ :<c-u>normal! T$vt$<cr>
"autocmd Filetype tex,latex,plaintex vnoremap <buffer> i$ T$ot$
"autocmd Filetype tex,latex,plaintex inoremap <buffer> $ $$i

" these need to be called after tex plugin to work TODO: verify
hi FoldColumn ctermbg=none ctermfg=cyan
hi FoldColumn guibg=black guifg=cyan
hi Folded ctermbg=black ctermfg=cyan
hi Folded guibg=black guifg=cyan

""""""""""""
" MAPPINGS "
""""""""""""
map <F7> :tabp <CR>
map <C-F7> :tabm -<CR>
map <F8> :tabn <CR>
map <C-F8> :tabm +<CR>
" fixing some un-utilized parts of the scandinavian keyboard (TODO: make this depend on keyboard layout?)
map å ^
map ¤ $
" nnoremap Y y$ TODO: figure this out, this breaks 'yy'


call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']} " TODO: for plaintex as well (?)
call plug#end()


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

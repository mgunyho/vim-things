" move down wrapped rows with k and j in tex files
nnoremap <buffer> k gk
nnoremap <buffer> j gj

inoremap <buffer> <C-b> \textbf{}i
vnoremap <buffer> <C-b> `>a}`<i\textbf{lviB

"TODO: this overrides <Tab> in insert mode, fix that
inoremap <buffer> <C-i> \emph{}i
"TODO: use onoremap? how does it work?
vnoremap <buffer> <C-i> `>a}`<i\emph{lviB

" select inside math mode etc.
onoremap <buffer> <silent> i$ :<c-u>normal! T$vt$<cr>
"autocmd Filetype tex,latex,plaintex vnoremap <buffer> i$ T$ot$
"TODO: dollar sign things, see http://stackoverflow.com/a/35042848/5208725
"vnoremap <buffer> $$ ??? " <- surround by $
inoremap <buffer> $ $$i
vnoremap <buffer> ¤ <ESC>`>a$<ESC>`<i$<ESC>lvt$


" math related shortcuts
" TODO: look up other handy ones in texstudio settings.
inoremap <buffer> <C-f> \dfrac{}{}F}i
"ctrl+u and ctrl+d for _{} and ^{}
"NOTE: ctrl+u overrides 'erase inserted characters' (see :h i_CTRL-U)
"autocmd Filetype tex,latex,plaintex, inoremap <buffer> <C-u> ^{}i
"NOTE: ctrl+d overrides 'unindent by one (or sth like that)' (see :h i_CTRL-D)
inoremap <buffer> <C-d> _{}i


"TODO: spelling
"setlocal spell spellang=en_gb

"NOTE: this assumes that vimtex is loaded
"TODO: if exists(g:plugs) | if get(g:plugs, 'vimtex', 0) != 0  ... noremap ...
"TODO: figure out the command (see map \ll)
"nnoremap <buffer> <localleader>lr <Plug>vimtex-compile-toggle
"nnoremap <buffer> <localleader>lr 2\ll

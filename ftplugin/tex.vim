" map j and k to gj and gk in tex files, except when a 'count' is specified.
"
function! Gjk(count, dir)
	if count == 0
		exe "normal! g" . a:dir
	else
		exe "normal! " . a:count . a:dir
	endif
endfunction
nnoremap <silent> <buffer> k :<C-U>call Gjk(v:count, "k")<CR>
nnoremap <silent> <buffer> j :<C-U>call Gjk(v:count, "j")<CR>


"TODO: replace these with surround.vim

" Ctrl+b for bold
inoremap <buffer> <C-b> \textbf{}<Esc>i
vnoremap <buffer> <C-b> <Esc>`>a}<Esc>`<i\textbf{<Esc>lviB

" Fix a common mistake when commenting
inoremap <buffer> ¤ %

" Ctrl+i for italics
"TODO: this overrides <Tab> in insert mode, fix that
inoremap <buffer> <C-i> \emph{}<Esc>i
"TODO: use onoremap? how does it work?
vnoremap <buffer> <C-i> <Esc>`>a}<Esc>`<i\emph{<Esc>lviB
" slightly more concise, but breaks if there's a newline in the selection.
"vnoremap <buffer> <C-i> s\emph{ <Esc>vpa}<Esc>gv

" select inside math mode etc.
onoremap <buffer> <silent> i$ :<c-u>normal! T$vt$<cr>
"autocmd Filetype tex,latex,plaintex vnoremap <buffer> i$ T$ot$
"TODO: dollar sign things, see http://stackoverflow.com/a/35042848/5208725
"vnoremap <buffer> $$ ??? " <- surround by $
"inoremap <buffer> $ $$i
vnoremap <buffer> ¤ <ESC>`>a$<ESC>`<i$<ESC>lvt$


" math related shortcuts
" TODO: look up other handy ones in texstudio settings.

" ctrl+f for dfrac
inoremap <buffer> <C-f> \dfrac{}{}<Esc>F}i

"ctrl+u and ctrl+d for _{} and ^{}
"NOTE: ctrl+u overrides 'erase inserted characters' (see :h i_CTRL-U)
inoremap <buffer> <C-u> ^{}<Esc>i
vnoremap <buffer> <C-u> <Esc>`>a}<Esc>`<i^{<Esc>lviB
"NOTE: ctrl+d overrides 'unindent by one (or sth like that)' (see :h i_CTRL-D)
inoremap <buffer> <C-d> _{}<Esc>i
vnoremap <buffer> <C-d> <Esc>`>a}<Esc>`<i_{<Esc>lviB


" see :help spell, zg to approve the spelling of a word.
setlocal spell spelllang=en_gb

"NOTE: this assumes that vimtex is loaded
"TODO: if exists(g:plugs) | if get(g:plugs, 'vimtex', 0) != 0  ... noremap ...
"TODO: figure out the command (see map \ll)
"nnoremap <buffer> <localleader>lr <Plug>vimtex-compile-toggle
"nnoremap <buffer> <localleader>lr 2\ll

"TODO: splits get screwed up on vimtex compile, see
"~/.vim/plugged/vimtex/autoload/vimtex/latexmk.vim, line 303 -> 
"(function vimtex#latexmk#output), esp. 'silent exe bwipeout ...'

" Latex-specific abbreviations commonly only used when writing tex.
ia <silent> <buffer> fig fig.~\ref{fig:}<Left><C-R>=Eatchar('.')<CR>
ia <silent> <buffer> ref ref.~\cite{}<Left><C-R>=Eatchar('.')<CR>
ia <silent> <buffer> eqn equation \eqref{eq:}<Left><C-R>=Eatchar('.')<CR>
ia <silent> <buffer> sec section \ref{sec:}<Left><C-R>=Eatchar('.')<CR>
"TODO: make these better (involves trickery with AutoClose)
ia <silent> <buffer> \left() \left(\right)<Esc>F(a<C-R>=Eatchar('.')<CR>
ia <silent> <buffer> \left{} \left{\right}<Esc>F{a<C-R>=Eatchar('.')<CR>
ia <buffer> cirquit circuit
ia <buffer> freq frequency
ia <buffer> nosie noise

"TODO: figure out why these don't work.
"ia <buffer> i.e. i.e.\
"ia <buffer> e.g. e.g.\

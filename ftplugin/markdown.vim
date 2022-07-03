" same as for tex files.

function! Gjk(count, dir)
	if count == 0
		exe "normal! g" . a:dir
	else
		exe "normal! " . a:count . a:dir
	endif
endfunction
nnoremap <silent> <buffer> k :<C-U>call Gjk(v:count, "k")<CR>
nnoremap <silent> <buffer> j :<C-U>call Gjk(v:count, "j")<CR>

"let g:instant_markdown_python = 1

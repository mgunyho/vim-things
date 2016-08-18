set t_vb=
set foldcolumn=1

try
	colorscheme one
	set background=dark
catch
	colorscheme torte
	hi FoldColumn guibg=black
	hi Folded guibg=black
endtry

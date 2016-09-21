" skip trailing space, copeid from :h abbreviations
" usage: ia <silent> foo bar<Left><C-R>=Eatchar("\s")<CR>
func! Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" Abbreviations to fix some common spelling mistakes.
" NOTE: using 'ab' instead of 'ia' corrects these while typing commands as well, 
" which might not be desirable.
ia ot to
ia si is
ia ti it
ia ni in
"ia no on
ia fo of
ia th the
ia hte the
ia teh the
ia nad and
ia adn and
ia tihs this
ia thsi this
ia wiht with
ia taht that
ia vawe wave
ia wiev view
ia lenght length
ia lentgh length
ia shoudl should

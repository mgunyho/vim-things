" skip trailing space, copeid from :h abbreviations
" usage: ia <silent> foo bar<Left><C-R>=Eatchar("\s")<CR>
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" Abbreviations to fix some common spelling mistakes.
" NOTE: using 'ab' instead of 'ia' corrects these while typing commands as well, 
" which might not be desirable.
ia nad and
ia adn and
ia tihs this
ia hte the
ia teh the
ia lenght length
ia lentgh length

set expandtab 
set smarttab 
set shiftwidth=2 
set tabstop=2
set softtabstop=2
"set smartindent " this causes e.g. '#' to jump to the beginning of the row...

" remap ¤ to # to avoid mistakes when commenting.
inoremap <buffer> ¤ #
nnoremap r¤ r#

ia <buffer> improt import
ia <buffer> false False
ia <buffer> true True
ia <buffer> none None
ia <buffer> noen None

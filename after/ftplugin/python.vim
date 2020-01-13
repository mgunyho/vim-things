set expandtab 
set smarttab 
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set smartindent " this causes e.g. '#' to jump to the beginning of the row...

" remap ¤ to # to avoid mistakes when commenting.
inoremap <buffer> ¤ #
nnoremap r¤ r#

ia <buffer> improt import
ia <buffer> false False
ia <buffer> true True
ia <buffer> none None
ia <buffer> noen None

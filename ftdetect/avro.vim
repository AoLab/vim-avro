autocmd BufNewFile,BufRead *.avsc set filetype=avro

augroup avro_autocmd
  autocmd!
  autocmd FileType avro setlocal autoindent
  autocmd FileType avro setlocal formatoptions=tcq2l
  autocmd FileType avro setlocal foldmethod=syntax
augroup END

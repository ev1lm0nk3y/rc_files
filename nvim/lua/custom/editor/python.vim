set nowrap

set colorcolumn=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

augroup pyfmt
  " format python before writing
  autocmd!
  au BufWritePre *.py isort
  au BufWritePre *.py black

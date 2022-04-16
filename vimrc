if has('python3')
  silent! python3 1
endif

set shiftwidth=2
set list
set listchars=tab:>\ ,trail:-,nbsp:+

set modeline
set laststatus=2
set noshowmode

syntax on
filetype plugin indent on

let g:goimports_simplify = 1
let g:lsp_diagnostics_echo_cursor = 1

colorscheme github
let g:lightline = { 'colorscheme': 'github' }

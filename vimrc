if has('python3')
  silent! python3 1
endif

set shiftwidth=2
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set modeline
set laststatus=2
set noshowmode

syntax on
filetype plugin indent on

let g:goimports_simplify = 1

"set background=dark
"let g:gruvbox_contrast_dark = "hard"
"colorscheme gruvbox
"highlight Normal ctermbg=none ctermfg=none

"colorscheme lightning
"let g:lightline = { 'colorscheme': 'one' }

colorscheme github
let g:lightline = { 'colorscheme': 'github' }

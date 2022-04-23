if has('python3')
  silent! python3 1
endif
call jetpack#begin()
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'mattn/vim-lsp-settings'
Jetpack 'mattn/vim-goimports'
Jetpack 'cespare/vim-toml'
Jetpack 'mattn/vim-sqlfmt'
Jetpack 'rhysd/vim-gfm-syntax'
Jetpack 'fgsch/vim-varnish'
Jetpack 'hashivim/vim-terraform'
Jetpack 'chriskempson/base16-vim'
Jetpack 'itchyny/lightline.vim'
call jetpack#end()

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

set termguicolors
"set background=light
colorscheme base16-bright

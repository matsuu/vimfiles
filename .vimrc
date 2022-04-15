if has('python3')
  silent! python3 1
endif

" set shiftwidth=2
" set tabstop=8
" set softtabstop=2

set modeline
set laststatus=2
set noshowmode

syntax on
filetype plugin indent on

"let g:lsp_diagnostics_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"let g:asyncomplete_popup_delay = 200
"let g:lsp_text_edit_enabled = 1
"let g:goimports_simplify = 1

"set background=dark
"let g:gruvbox_contrast_dark = "hard"
"colorscheme gruvbox
"highlight Normal ctermbg=none ctermfg=none

"colorscheme lightning
"let g:lightline = { 'colorscheme': 'one' }

colorscheme github
let g:lightline = { 'colorscheme': 'github' }

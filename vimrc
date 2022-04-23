function! s:packager_init(packager) abort
  call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call a:packager.add('prabirshrestha/asyncomplete-lsp.vim', {'requires': ['prabirshrestha/asyncomplete.vim', 'prabirshrestha/vim-lsp']})
  call a:packager.add('mattn/vim-lsp-settings')
  call a:packager.add('cespare/vim-toml')
  call a:packager.add('mattn/vim-sqlfmt')
  call a:packager.add('rhysd/vim-gfm-syntax')
  call a:packager.add('fgsch/vim-varnish')
  call a:packager.add('hashivim/vim-terraform')
  call a:packager.add('tpope/vim-fugitive')
  call a:packager.add('nanotech/jellybeans.vim')
  call a:packager.add('itchyny/lightline.vim')
endfunction

packadd vim-packager
call packager#setup(function('s:packager_init'))

set list
set listchars=tab:>\ ,trail:-,nbsp:+

set modeline
set laststatus=2
set noshowmode

filetype plugin indent on

" lsp
let g:lsp_diagnostics_echo_cursor = 1
autocmd BufWritePre <buffer> call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])

"set termguicolors
"set background=light
colorscheme jellybeans

function! s:packager_init(packager) abort
	" package
	call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
	" autocomplete
	call a:packager.add('prabirshrestha/asyncomplete-lsp.vim', {'requires': ['prabirshrestha/asyncomplete.vim']})
	call a:packager.add('mattn/vim-lsp-settings', {'requires': ['prabirshrestha/vim-lsp']})
	call a:packager.add('hrsh7th/vim-vsnip-integ', {'requires': ['hrsh7th/vim-vsnip']})
	" syntax
	call a:packager.add('mattn/vim-sqlfmt')
	call a:packager.add('rhysd/vim-gfm-syntax')
	call a:packager.add('fgsch/vim-varnish')
	call a:packager.add('hashivim/vim-terraform')
	" git
	call a:packager.add('tpope/vim-fugitive')
	" colorscheme
	call a:packager.add('NLKNguyen/papercolor-theme')
	" statusline
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

set background=dark
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:PaperColor_Theme_Options = {
			\	'theme': {
			\		'default': {
			\			'allow_bold': 1,
			\			'allow_italic': 1
			\		}
			\	}
			\}
try
	colorscheme PaperColor
catch
endtry

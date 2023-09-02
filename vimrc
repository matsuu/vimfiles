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
	" devicon
	call a:packager.add('ryanoasis/vim-devicons')
	" treeview
	call a:packager.add('preservim/nerdtree')
endfunction

packadd vim-packager
call packager#setup(function('s:packager_init'))

set hlsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-,nbsp:+
set modeline
set noshowmode
set noswapfile
set scrolloff=4

filetype plugin indent on
syntax enable

" lsp
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	"nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	"nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_echo_cursor = 1
autocmd BufWritePre <buffer> call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])
let g:lsp_settings = {
\	'gopls': {
\		'initialization_options': {
\			'usePlaceholders': v:true
\		}
\	},
\	'sumneko-lua-language-server': {
\		'workspace_config': {
\			'Lua': {
\				'diagnostics': {
\					'globals': [ 'vim' ],
\				},
\				'completion': {
\					'callSnippet': 'Replace'
\				}
\			}
\		}
\	}
\}


" asyncomplete
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Expand
imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'

" Expand or jump
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Theme
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

set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

augroup guard
	autocmd!
augroup END

set number
set tabstop=4
set shiftwidth=4
set backspace=2
set cindent
set title
set showmatch
set cursorline
set noswapfile
set autoread
set ruler
set hidden
set history=100
set showcmd
set incsearch
set hlsearch
set nowrap
set wrapscan
set ignorecase
set smartcase
set wildmenu
set listchars=tab:>\ ,eol:<
set list
set clipboard+=unnamedplus,unnamed

augroup fileTypeIndent
	autocmd guard BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp,*.py,*.php,*.json setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd guard BufNewFile,BufRead *.vue,*.rb,*.erb,*.html,*.scss,*.css,*.js,*.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

inoremap <C-c> <Esc>
"nnoremap ; :
"nnoremap : ;
nnoremap p "0p
nnoremap P "0P
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <expr> <Space>g ':grep --include=*.{c,cpp,h,hpp,rb,py,go,html,css,scss,js,erb,php,sql,rs,sh,tpl,md,vue} -r ' . expand('<cword>') . ' .'
nnoremap <Space>h 0
nnoremap <Space>j ]]zz
nnoremap <Space>k [[zz
nnoremap <Space>l $
nnoremap <Space>t <C-]>
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

set t_Co=256
syntax enable
set background=dark

autocmd guard VimEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd guard WinLeave * setlocal nocursorline

autocmd guard QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen |  endif

if &diff
	set splitright
	nnoremap <Space><Space> ]czz
	if !exists(":DiffOrig")
		command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
					\ | wincmd p | diffthis
	endif
endif

"fish
if &shell =~# 'fish$'
	set shell=sh
endif

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'pearofducks/ansible-vim'
Plug 'jparise/vim-graphql'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdtree'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
if has('win32') || has ('win64')
else
	Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}
endif
call plug#end()
colo hybrid

"vim-lsp
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

nmap <silent> <Space>d :LspDefinition<CR>
nmap <silent> <Space>r :LspReferences<CR>

au User lsp_setup call lsp#register_server({
			\ 'name': 'intelephense',
			\ 'cmd': {server_info->['node', expand('PATH_TO_GLOBAL_NODE_MODULES/intelephense/lib/intelephense.js'), '--stdio']},
			\ 'initialization_options': {"storagePath": "PATH_TO_TEMP_FOLDER/intelephense"},
			\ 'whitelist': ['php'],
			\ })

au User lsp_setup call lsp#register_server({                                    
			\ 'name': 'php-language-server',                                            
			\ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
			\ 'whitelist': ['php'],                                                     
			\ })

if executable('gopls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'gopls',
				\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
				\ 'whitelist': ['go'],
				\ })
	autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('go-langserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'go-langserver',
				\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
				\ 'whitelist': ['go'],
				\ })
	autocmd BufWritePre *.go LspDocumentFormatSync
endif

"nerdtree
nnoremap <Space>e :NERDTreeToggle<CR>

"vim-go
let g:go_version_warning = 0

"emmet-vim
let g:user_emmet_leader_key = '<C-y>'

"ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <Space>f :CtrlP<CR>
nnoremap <Space>m :CtrlPMRUFiles<CR>
nnoremap <Space>l :CtrlPClearCache<CR>

"vim-vue
autocmd guard FileType vue syntax sync fromstart

"tagbar
nnoremap <Space>o :TagbarToggle<CR>

"fugitive
nnoremap <Space>b :Gblame<CR>

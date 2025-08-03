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
set re=0
set spelllang=en,cjk
"set spell

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
"nnoremap <expr> <Space>g ':grep
"			\ --include="*.html"
"			\ --include="*.rb"
"			\ --include="*.erb"
"			\ --include="*.vue"
"			\ --include="*.js"
"			\ --include="*.ts"
"			\ --include="*.md"
"			\ --include="*.h"
"			\ --include="*.c"
"			\ --include="*.cpp"
"			\ --include="*.hpp"
"			\ --include="*.rs"
"			\ --include="*.go"
"			\ --include="*.py"
"			\ --include="*.php"
"			\ --include="*.sh"
"			\ --include="*.json"
"			\ --include="*.yml"
"			\ --include="*.toml"
"			\ --include="*.css"
"			\ --include="*.scss"
"			\ --exclude="*.d"
"			\ --exclude="*.a"
"			\ --exclude="*.so"
"			\ --exclude="*.min.js"
"			\ --exclude-dir=".git"
"			\ -rI ' . expand('<cword>') . ' .'
nnoremap <Space>h 0
nnoremap <Space>j ]]zz
nnoremap <Space>k [[zz
nnoremap <Space>l $
nnoremap <Space>t g<C-]>
nnoremap <C-t> <Plug>(coc-implementation)
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
cmap w!! w !sudo tee > /dev/null %

set t_Co=256
syntax enable
set background=dark

autocmd guard VimEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd guard WinLeave * setlocal nocursorline

autocmd guard QuickfixCmdPost make,grepadd,vimgrep if len(getqflist()) != 0 | copen |  endif

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
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'posva/vim-vue'
"Plug 'leafOfTree/vim-vue-plugin'
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
"Plug 'scrooloose/nerdtree'
Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'nicwest/vim-camelsnek'
Plug 'will133/vim-dirdiff'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
if has('win32') || has ('win64')
else
	Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}
endif
call plug#end()
colo hybrid

let g:coc_global_extensions = [ 
			\'coc-lists', 
			\'coc-explorer', 
			\'coc-json', 
			\'@yaegassy/coc-volar', 
			\'coc-solargraph', 
			\'coc-tsserver',
			\]

"vim-lsp
"let g:asyncomplete_remove_duplicates = 1
"let g:asyncomplete_smart_completion = 1
"let g:asyncomplete_auto_popup = 1

"nmap <silent> <Space>d :LspDefinition<CR>
"nmap <silent> <Space>r :LspReferences<CR>

"if executable('gopls')
"	au User lsp_setup call lsp#register_server({
"				\ 'name': 'gopls',
"				\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"				\ 'whitelist': ['go'],
"				\ })
"	autocmd BufWritePre *.go LspDocumentFormatSync
"endif

"if executable('go-langserver')
"	au User lsp_setup call lsp#register_server({
"				\ 'name': 'go-langserver',
"				\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"				\ 'whitelist': ['go'],
"				\ })
"	autocmd BufWritePre *.go LspDocumentFormatSync
"endif

"nerdtree
"nnoremap <Space>e :NERDTreeToggle<CR>

"vim-go
let g:go_version_warning = 0

"emmet-vim
let g:user_emmet_leader_key = '<C-y>'

"ctrlp
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"nnoremap <Space>f :CtrlP<CR>
"nnoremap <Space>m :CtrlPMRUFiles<CR>
"nnoremap <Space>l :CtrlPClearCache<CR>

"vim-vue
autocmd guard FileType vue syntax sync fromstart

"tagbar
nnoremap <Space>w :TagbarToggle<CR>

"fugitive
nnoremap <Space>b :Git blame<CR>

"vim-camelsnek
" Some organisations use the terms camel and pascal to differentiate between
" the two variants of camel case. This setting changes the commands:
" :Camel  -> :Pascal
" :CamelB -> :Camel
let g:camelsnek_alternative_camel_commands = 1

" This setting also changes the name of a command:
" :Snek -> :Snak
let g:camelsnek_i_am_an_old_fart_with_no_sense_of_humour_or_internet_culture = 1

"coc.nvim
set statusline^=%{coc#status()}

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Space>g :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

"CocList
nnoremap <Space>f :CocList files<CR>
nnoremap <Space>m :CocList mru<CR>

"coc-explorer
nnoremap <space>e <Cmd>CocCommand explorer<CR>
"autocmd VimEnter * CocCommand explorer

"do/end jump
source $VIMRUNTIME/macros/matchit.vim

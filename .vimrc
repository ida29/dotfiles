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
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[%{&ff}]
set statusline+=[%{&fileencoding}]
set statusline+=[%l/%L]
set laststatus=2
set hidden
set history=300
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
colorscheme hybrid

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
" install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
call plug#end()

"vim-go
let g:go_version_warning = 0

"emmet-vim
let g:user_emmet_leader_key = '<C-y>'

"ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <Space>f :CtrlP<CR>
nnoremap <Space>e :CtrlPMixed<CR>
nnoremap <Space>m :CtrlPMRUFiles<CR>

" vim-vue
autocmd guard FileType vue syntax sync fromstart

" tagbar
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
nnoremap <Space>o :TagbarToggle<CR>


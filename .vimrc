set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

augroup guard
		autocmd!
augroup END

set number
set cindent
set title
set showmatch
set cursorline
set noswapfile
set autoread
set ruler
set tabstop=4
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
set paste
set wildmenu
set listchars=tab:>\ ,eol:<
set list
set backspace=indent,eol,start
set clipboard+=unnamedplus,unnamed

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
nnoremap <expr> <Space>g ':grep --include=*.{c,cpp,h,hpp,rb,py,go,html,css,scss,js,erb,php,sql,rs,sh,tpl} -r ' . expand('<cword>') . ' .'
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

"dein
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
		execute '!git clone -b 1.5 https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/unite-outline')
call dein#add('fatih/vim-go')
call dein#add('mattn/emmet-vim')
call dein#end()

if dein#check_install()
		call dein#install()
endif

filetype plugin indent on

"vim-go
let g:go_version_warning = 0

"emmet-vim
let g:user_emmet_leader_key = '<C-y>'

"unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>e :<C-u>Unite file_rec<CR>
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>o :<C-u>Unite outline<CR>
au FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>


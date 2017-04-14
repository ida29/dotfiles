set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
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
set statusline+=[ENC=%{&fileencoding}]
set statusline+=[LOW=%l/%L]
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

inoremap <C-c> <Esc>
nnoremap p "0p
nnoremap P "0P
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <expr> <Space>g ':grep --include=*.{c,h} -r ' . expand('<cword>') . ' .'
nnoremap <Space>h 0
nnoremap <Space>j ]]
nnoremap <Space>k [[
nnoremap <Space>l $
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

if &diff
		nnoremap <Space><Space> ]c
endif

set t_Co=256
syntax enable
set background=dark
colorscheme hybrid

autocmd guard VimEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd guard WinLeave * setlocal nocursorline

autocmd guard QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen |  endif

autocmd guard VimEnter,BufWinEnter,WinEnter * let cxout='ctags -x ' . expand("%:p") . "| grep -e \"function\" -e \"macro\" | awk '{print $4\"|\"$3\"|\",$1}'"
nnoremap <expr> cx ':cexpr system(cxout)'

autocmd guard VimEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd guard WinLeave * setlocal nocursorline

set splitright
if !exists(":DiffOrig")
		command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
								\ | wincmd p | diffthis
endif

"netrw
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1

"dein
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
if has ('mac') || has ('unix')
		call dein#add('Shougo/vimproc.vim', {'build':'make'})
endif
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#end()

if dein#check_install()
		call dein#install()
endif

filetype plugin indent on

"unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>e :<C-u>Unite file_rec<CR>
if executable('ag')
		let g:unite_source_grep_command = 'ag'
		let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
		let g:unite_source_grep_recursive_opt = ''
		nnoremap <silent> <Space>a :<C-u>Unite file_rec/async:!<CR>
endif
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>i :<C-u>Unite file_include<CR>
nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>
au FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>

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
	autocmd guard BufNewFile,BufRead *.py,*.php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
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

"dein
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  if has("unix") " winだとうまく動かん
    call dein#add('Shougo/vimproc.vim')
  endif
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('posva/vim-vue')
  call dein#add('fatih/vim-go')
  call dein#add('mattn/emmet-vim')
  call dein#add('pearofducks/ansible-vim')
  call dein#add('jparise/vim-graphql')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"vim-go
let g:go_version_warning = 0

"emmet-vim
let g:user_emmet_leader_key = '<C-y>'

"unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

nnoremap <silent> <Space>f :<C-u>Unite file<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>e :<C-u>Unite file_rec<CR>
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>o :<C-u>Unite outline<CR>
au FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>

let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'

call unite#custom#source(
      \ 'file_rec',
      \ 'ignore_pattern',
      \ s:unite_ignore_file_rec_patterns)

" vim-vue
autocmd guard FileType vue syntax sync fromstart

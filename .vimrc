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

inoremap <C-c> <Esc>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <expr> <Space>a ':a!'
nnoremap <expr> <Space>e ':e ./**/'
nnoremap <expr> <Space>g ':grep --include=*.{c,h} -r ' . expand('<cword>') . ' .'
nnoremap <Space>h 0
nnoremap <Space>j ]]
nnoremap <Space>k [[
nnoremap <Space>l $
nnoremap <expr> <Space>m ':marks'
nnoremap <F7> [c
nnoremap <F8> ]c
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

autocmd guard VimEnter,BufWinEnter,WinEnter * let cxout='ctags -x ' . expand("%:p") . "| grep -e \"function\" -e \"macro\" | awk '{print $4\"|\"$3\"|\",$1}'"
nnoremap <expr> cx ':cexpr system(cxout)'

autocmd guard VimEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd guard WinLeave * setlocal nocursorline

set splitright
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


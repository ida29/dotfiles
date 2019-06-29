mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.ctags" %HOMEPATH%"\dotfiles\.ctags"
mkdir %HOMEPATH%"\.vim
mklink /D %HOMEPATH%"\.vim\colors" %HOMEPATH%"\dotfiles\colors"
exit 0

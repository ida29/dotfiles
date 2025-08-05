mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.ctags" %HOMEPATH%"\dotfiles\.ctags"

REM Create Neovim config directory and symlink
if not exist %LOCALAPPDATA%"\nvim" mkdir %LOCALAPPDATA%"\nvim"
mklink %LOCALAPPDATA%"\nvim\init.lua" %HOMEPATH%"\dotfiles\.config\nvim\init.lua"
mklink %LOCALAPPDATA%"\nvim\lazy-lock.json" %HOMEPATH%"\dotfiles\.config\nvim\lazy-lock.json"

exit 0

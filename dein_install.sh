#!/bin/bash
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# If use vim 7.4, dein version 1.5 is needed.
# git checkout -b 1.5 refs/tags/1.5

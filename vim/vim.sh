#!/bin/bash
OLDPATH=$PWD
SCRIPTPATH="$BASH_SOURCE"
cd
git clone https://github.com/vim/vim.git
${SCRIPTPATH}/vim_update.sh
cd OLDPATH
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
unset OLDPATH
ln -s ${SCRIPTPATH}/.vimrc ~/.vimrc
vim +PluginInstall +qall
unset SCRIPTPATH

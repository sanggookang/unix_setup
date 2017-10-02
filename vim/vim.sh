#!/bin/bash
OLDPATH=$PWD
SCRIPTPATH=`dirname $BASH_SOURCE`
cd
git clone https://github.com/vim/vim.git
cd $OLDPATH
${SCRIPTPATH}/vim_install_python3.sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
unset OLDPATH
sudo cp ${SCRIPTPATH}/.vimrc ~/.vimrc
vim +PluginInstall +qall
unset SCRIPTPATH

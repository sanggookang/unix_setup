#!/bin/bash
DIR=$PWD
cd /tmp
if [ "$(uname)" == "Darwin" ]; then
  curl https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh > Miniconda3.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh > Miniconda3.sh
fi
bash Miniconda3.sh
rm Miniconda3.sh
conda create python=2.7 -y --name root2
ln -s ~/miniconda3/envs/root2/bin/pip ~/miniconda3/bin/pip2
ln -s ~/miniconda3/envs/root2/bin/python ~/miniconda3/bin/python2
cd $DIR
unset DIR

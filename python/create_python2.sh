#!/bin/bash
conda create python=2.7 -y --name root2
ln -s ~/miniconda3/envs/root2/bin/pip ~/miniconda3/bin/pip2
ln -s ~/miniconda3/envs/root2/bin/python ~/miniconda3/bin/python2

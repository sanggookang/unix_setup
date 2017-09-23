#!/bin/bash
cuda_url="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-8-0_8.0.61-1_amd64.deb"

cd /tmp
curl cuda_url > cuda.deb
sudo dpkg -i cuda.deb
sudo apt-get update && sudo apt-get install cuda

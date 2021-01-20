#!/bin/bash

# Update All
sudo apt-get update && apt-get upgrade -y

# Install necessary things
sudo apt-get install tmux apt-transport-https ca-certificates software-properties-common git -y

# Install Docker
sudo curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo curl https://download.docker.com/linux/raspbian/gpg
echo deb https://download.docker.com/linux/raspbian/ stretch stable | /etc/apt/sources.list
systemctl start docker.service



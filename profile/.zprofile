# Ctrl-U to backward kill line
bindkey "^u" backward-kill-line

docker_clean() {
  local name=$(basename "$PWD")
  local dangling_images=("${(@f)$(sudo docker images -f "dangling=true" -q)}")
  if [[ ! -z $(sudo docker ps -a | grep $name) ]]; then
    echo removing outdated container
    sudo docker rm $name
  fi
	if [[ ! -z $dangling_images ]]; then
		echo removing outdated images
    for image in $dangling_images
    do
      echo removing image: $image
      sudo docker rmi $image
    done
	fi
}

# Build Docker from folder
docker_build() {
  local tag="latest"
  if [[ ! -a $1 ]]; then
    tag=$1
  fi
  docker_clean
	sudo docker build --rm -t $(basename "$PWD"):"$tag" . 
}

# Run Docker from folder
docker_run() {
  local tag="latest"
  if [[ ! -a $1 ]]; then
    tag=$1
  fi
  docker_clean
	sudo docker run --gpus all --name $(basename "$PWD") $(basename "$PWD"):"$tag"
}

ssh_tmux() {
  if [[ -z $1 ]]; then
    echo Need an ssh destination!
    return
  fi
  if [[ ! -z $2 && $2=='-nd' ]]; then
    ssh -t $1 'tmux a -t macbook || tmux new -s macbook'
  else
    ssh -t $1 'tmux a -d -t macbook || tmux new -s macbook'
  fi
}

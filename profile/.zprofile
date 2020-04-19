export TERM=xterm-256color

# Ctrl-U to backward kill line
bindkey "^u" backward-kill-line

# Prevent zsh globbing characters
unsetopt nomatch

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
  if [[ ! -z $1 ]]; then
    echo tag: $1
    tag=$1
  fi
  docker_clean
  cmd=(sudo docker build --rm -t $(basename $PWD):$tag)
  cmd+=(.)
  echo ${cmd[@]}
  "${cmd[@]}"
}

# Run Docker from folder
docker_run() {
  local tag="latest"
  if [[ ! -z $1 ]]; then
    tag=$1
  fi
  docker_clean
  cmd=(sudo docker run --name $(basename $PWD))

  if [[ $(type nvidia-smi &> /dev/null) ]]; then
    COMMAND+=(--gpus all)
  fi
  cmd+=($(basename $PWD):$tag)
  echo ${cmd[@]}
  "${cmd[@]}"
}

ssh_tmux() {
  if [[ -z $1 ]]; then
    echo Need an ssh destination!
    return
  fi
  if [[ ! -z $2 && $2=='-nd' ]]; then
    ssh -t $1 'tmux a -t sanggoo || tmux new -s sanggoo'
  else
    ssh -t $1 'tmux a -d -t sanggoo || tmux new -s sanggoo'
  fi
}

export RASPI="pi@192.168.1.66"

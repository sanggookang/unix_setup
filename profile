# Local Path
export PATH=/usr/local/bin:$PATH

#ls changes
alias ls="ls -N --color=yes --group-directories-first"

#custom dir colors
eval `dircolors ~/.dir_colors`

# added by Miniconda3 installer
export PATH="${HOME}/miniconda3/bin:$PATH"
alias mkvirtualenv="conda create python=3.6 --name"
alias mkvirtualenv2="conda create python=2.7 --name"
alias mkvirtualenv3="conda create python=3.6 --name"
alias lsvirtualenv="conda env list"
alias rmvirtualenv="conda env remove --name"
alias workon="source activate"
alias exitenv="source deactivate"

function default_path(){
  OLDPATH=$PATH
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
}

function reset_path(){
  export PATH=$OLDPATH
  unset OLDPATH
}

function brew(){
  if [ $# -eq 0 ]; then
    command brew
    return
  fi
  if [ "$1" == "upgrade" ]; then
    default_path
    command brew "$@"
    reset_path
  else
    command brew "$@"
  fi
}

function virtualenv(){
  default_path
  command virtualenv "$@"
  reset_path
}

function conda2(){
  workon root2
  conda "$@"
  deactivate
}


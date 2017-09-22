# Local Path
export PATH=/usr/local/bin:$PATH

# ls changes
alias ls="ls -N --color=yes --group-directories-first"

# custom dir colors
eval `dircolors ~/.dir_colors`

# Miniconda3 path
export PATH="${HOME}/miniconda3/bin:$PATH"

# mkvirtualenv
alias mkvirtualenv="conda create python=3.6 --name"
alias mkvirtualenv2="conda create python=2.7 --name"
alias mkvirtualenv3="conda create python=3.6 --name"
alias lsvirtualenv="conda env list"
alias rmvirtualenv="conda env remove --name"
alias workon="source activate"
alias exitenv="source deactivate"
function conda2(){
  workon root2
  conda "$@"
  deactivate
}

# Path functions
function default_path(){
  OLDPATH=$PATH
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
}
function reset_path(){
  export PATH=$OLDPATH
  unset OLDPATH
}

# Python virtualenv
function virtualenv(){
  default_path
  command virtualenv "$@"
  reset_path
}


if [ "$(uname)" == "Darwin" ]; then
  source ${HOME}/.macprofile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  source ${HOME}/.linuxprofile
fi

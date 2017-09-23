#!/bin/bash
if [ -f ~/.profile_settings ]; then
  echo "~/.profile_settings already exists! Do you want to reset it? [y/N] "
  read RESET
  if [[ $RESET =~ ^[Yy]$ ]]; then
    rm ~/.profile_settings
  else
    exit
  fi
fi
touch ~/.profile_settings

if [ "$(uname)" == "Darwin" ]; then
  CURR_OS="Mac OSX"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  CURR_OS="Linux"
fi

echo "Enter your OS (options: Mac OSX, Linux) [default: ${CURR_OS}]: "
read OS
if [ "$OS" != "Mac OSX" ] && [ "$OS" != "Linux" ] && [ "$OS" != "" ]; then
  echo "Error, invalid OS. Using ${CURR_OS}..."
elif [ "$OS" == "" ]; then
  unset OS
else
  CURR_OS=$OS
fi
echo "export CURR_OS=\"$CURR_OS\"" >> ~/.profile_settings
unset CURR_OS
unset OS

echo "Do you want python2 or python3 to be default? [default: python3]: "
read PYTHON
if [ "$PYTHON" != "python3" ] && [ "$PYTHON" != "" ]; then
  if [ "$PYTHON" != "python2" ]; then
    echo "Error, invalid entry. Using python3..."
    export PYTHONVERSION="3.6"
  else
    export PYTHONVERSION="2.7"
  fi
else
  export PYTHONVERSION="3.6"
fi
echo "export PYTHONVERSION=\"$PYTHONVERSION\"" >> ~/.profile_settings
unset PYTHON
unset PYTHONVERSION

echo "Do you want to use CUDA? [y/N]: "
read USE_CUDA
if [[ $USE_CUDA =~ ^[Yy]$ ]]; then
  USE_CUDA="yes"
else
  USE_CUDA="no"
fi
echo "export USE_CUDA=\"$USE_CUDA\"" >> ~/.profile_settings

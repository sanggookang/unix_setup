#!/bin/bash
if [ ! -f ~/.keras/keras.json ]; then
    mkdir ~/.keras
    cp /usr/local/deep_learning/keras_cntk.json ~/.keras/keras.json
fi
ver=$(python --version 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
if [ "$ver" -eq "27" ]; then
    pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp27-cp27mu-linux_x86_64.whl
    exit 1
fi
if [ "$ver" -eq "34" ]; then
    pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp34-cp34m-linux_x86_64.whl
    exit 1
fi
if [ "$ver" -eq "35" ]; then
    pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp35-cp35m-linux_x86_64.whl
    exit 1
fi
if [ "$ver" -eq "36" ]; then
    pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp36-cp36m-linux_x86_64.whl
    exit 1
fi

echo "You need python to link to version 2.7, 3.4, 2.5, or 3.6"
exit 1

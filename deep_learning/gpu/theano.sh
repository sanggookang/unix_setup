#!/bin/bash
conda config --add channels conda-forge
conda install -y numpy scipy mkl nose sphinx pygpu mkl-service
pip install --no-deps git+https://github.com/Theano/Theano.git#egg=Theano
cp /usr/local/deep_learning/.theanorc ~/.theanorc
if [ ! -f ~/.keras/keras.json ]; then
    mkdir ~/.keras
    cp /usr/local/deep_learning/keras_theano.json ~/.keras/keras.json
fi

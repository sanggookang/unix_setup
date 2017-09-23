if [ -z "$1" ]; then
  echo "Please download the cuDNN Library, then give the path to the library: "
  read PATH
else
  PATH=$1
fi
if [ -z "$2" ]; then
  echo "Please enter the path to cuda installation [default: /usr/local/cuda-8.0]: "
  read $CUDAPATH
else
  CUDAPATH=$2
fi
tar -xzf $PATH
cd cuda
sudo cp include/* ${CUDAPATH}/include
sudo cp lib64/* ${CUDAPATH}/lib64
cd ..
rm -rf cuda

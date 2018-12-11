# this script especially for cuda8.0 + cudnn5.1

# install gcc/g++
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-6 g++-6

sudo apt-get install build-essential cmake git unzip pkg-config
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgtk-3-dev
sudo apt-get install libhdf5-serial-dev graphviz
sudo apt-get install libopenblas-dev libatlas-base-dev gfortran

# sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
# sudo apt update
# sudo apt install cuda

# sudo gedit /etc/environment
# add /usr/local/cuda-8.0/bin

# tar xzvf cudnn-8.0-linux-x64-v5.1.tgz 
# sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
# sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
# sudo ldconfig
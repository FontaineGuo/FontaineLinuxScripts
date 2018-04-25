######################################
# INSTALL OPENCV ON UBUNTU OR DEBIAN #
######################################

# |         THIS SCRIPT IS TESTED CORRECTLY ON         |
# |----------------------------------------------------|
# | OS             | OpenCV       | Test | Last test   |
# |----------------|--------------|------|-------------|
# | deepin 15.5    | OpenCV 3.4.1 | OK   | 14 Mar 2018 |

# reference to https://github.com/FontaineGuo/milq/blob/master/scripts/bash/install-opencv.sh

# VERSION TO BE INSTALLED

OPENCV_VERSION='3.4.1'

# 1. Keep software up to date 
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# 2. Install the dependencies

# Build tools:
sudo apt-get install -y build-essential checkinstall cmake pkg-config yasm
sudo apt-get install git gfortran

# GUI
sudo apt-get install -y qt5-default libvtk6-dev libgtk2.0-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev libjpeg8-dev libjasper-dev libpng12-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen

# 3. Install python environment
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip3 install -U pip numpy

# 4. Install python virtualEnvironment
sudo pip3 install virtualenv virtualenvwrapper

# write the following to the /.bashrc
######################################
# "# Virtual Environment Wrapper" 
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
######################################
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

# 4. INSTALL THE LIBRARY

sudo apt-get install -y unzip wget

wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV

wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv_contrib-${OPENCV_VERSION} Opencv_contrib

cd OpenCV
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE
	  -DWITH_QT=ON 
	  -DWITH_OPENGL=ON 
	  -DFORCE_VTK=ON 
	  -DWITH_TBB=ON
	  -DWITH_V4L=ON 
	  -DWITH_GDAL=ON 
	  -DWITH_XINE=ON 
	  -DBUILD_EXAMPLES=ON 
	  -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules
	  -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install
sudo ldconfig

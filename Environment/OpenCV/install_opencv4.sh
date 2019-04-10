OPENCV_VERSION='4.1.0'


# Keep software up tp date
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# install toolchains
sudo apt-get install -y build-essential cmake unzip pkg-config unzip wget

sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
sudo apt-get install -y ffmpeg
# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev


# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen

# specific for 4.0
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install -y libgtk2.0-dev 
sudo apt-get install -y libfaac-dev libmp3lame-dev 
sudo apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils

# Optional dependencies
sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libgphoto2-dev  libhdf5-dev 


# install 
proxychains wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV

cd OpenCV

proxychains wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip 
mv opencv_contrib-${OPENCV_VERSION} Opencv_contrib

mkdir build
cd build


proxychains cmake -DCMAKE_BUILD_TYPE=RELEASE\
	  -DCMAKE_INSTALL_PREFIX=/home/fontaine/LIB_Collections/OpenCV/4.0/install\
	  -DWITH_QT=ON\
	  -DWITH_OPENGL=ON\
	  -DFORCE_VTK=ON\
	  -DWITH_TBB=ON\
	  -DWITH_V4L=ON\
	  -DWITH_GDAL=ON\
	  -DWITH_XINE=ON\
	  -DWITH_FFMPEG=ON\
	  -DBUILD_EXAMPLES=ON\
	  -DWITH_LIBV4L=ON\
	  -DOPENCV_EXTRA_MODULES_PATH=../Opencv_contrib/modules\
      -DPYTHON_EXECUTABLE=/home/fontaine/anaconda3/envs/py36/bin/python \
	  -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install
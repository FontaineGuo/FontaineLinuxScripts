OPENCV_VERSION='4.1.0'


# Keep software up tp date
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


 
## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm unzip wget

sudo apt -y install git gfortran
sudo apt -y install libjpeg8-dev libpng-dev
 
sudo apt -y install software-properties-common
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt -y update
 
sudo apt -y install libjasper1
sudo apt -y install libtiff-dev
 
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd "$cwd"
 
sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
 
# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

sudo apt -y install python3-dev python3-pip
sudo -H pip3 install -U pip numpy
sudo apt -y install python3-testresources

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



cmake -DCMAKE_BUILD_TYPE=RELEASE\
	  -DCMAKE_INSTALL_PREFIX=/home/fontaine/LIB_Collections/OpenCV/4.0/install\
	  -DOPENCV_GENERATE_PKGCONFIG=YES\
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
      -DBUILD_opencv_python2=OFF \
      -DBUILD_opencv_python3=ON \
	  -DPYTHON_EXECUTABLE=/usr/bin/python \
	  -DPYTHON3_EXECUTABLE=/usr/bin/python \
	  -DINSTALL_C_EXAMPLES=OFF \
	  -DINSTALL_C_EXAMPLES=OFF \
	  -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install
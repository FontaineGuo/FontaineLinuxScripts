# sudo apt-get -y update
# sudo apt-get -y upgrade


# sudo apt-get install -y build-essential cmake

# sudo apt-get remove x264 libx264-dev
# sudo apt-get install build-essential checkinstall cmake pkg-config yasm
# sudo apt-get install git gfortran
# sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev

# sudo apt-get install libtiff5-dev
 
# sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
# sudo apt-get install libxine2-dev libv4l-dev
# sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
# sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev libvtk6-dev
# sudo apt-get install libatlas-base-dev
# sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
# sudo apt-get install libvorbis-dev libxvidcore-dev
# sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
# sudo apt-get install x264 v4l-utils
# sudo apt-get install zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
# sudo apt-get install -y ffmpeg

# sudo apt-get install libprotobuf-dev protobuf-compiler
# sudo apt-get install libgoogle-glog-dev libgflags-dev
# sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# sudo apt-get install -y ant default-jdk

# sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# git clone https://github.com/opencv/opencv.git
# cd opencv 
# git checkout 3.4.1
# cd ..

# git clone https://github.com/opencv/opencv_contrib.git
# cd opencv_contrib
# git checkout 3.4.1
# cd ..

cd opencv
# mkdir installed
# mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE \
      -DCMAKE_INSTALL_PREFIX=/home/fontaine/Lib_Collection/OpenCV/OpenCV341/opencv/installed \
      -DPATH=$NOCONDA_PATH \
      -DPYTHON3_EXECUTABLE=/home/fontaine/anaconda3/bin/python \
      -DPYTHON3_INCLUDE_DIR=/home/fontaine/anaconda3/include/python3.6m \
      -DPYTHON3_LIBRARIES=/home/fontaine/anaconda3//lib/python3.6/site-packages \
      -DINSTALL_C_EXAMPLES=ON \
      -DINSTALL_PYTHON_EXAMPLES=ON \
      -DWITH_TBB=ON \
      -DWITH_V4L=ON \
      -DWITH_QT=ON \
      -DWITH_GDAL=ON \
      -DWITH_OPENGL=ON \
      -DWITH_FFMPEG=ON\
      -DFORCE_VTK=ON\
      -DWITH_XINE=ON\
      -DWITH_LIBV4L=ON\
      -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -DBUILD_EXAMPLES=ON \
      -DENABLE_PRECOMPILED_HEADERS=OFF ..

# make -j4
# sudo make install
# sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
# sudo ldconfig
wget http://dlib.net/files/dlib-19.13.tar.bz2
tar xf dlib-19.13.tar.bz2
cd dlib-19.13
mkdir build 
cd build 
cmake ..
cmake --build . --config Release
sudo make install
sudo ldconfig
cd ../..
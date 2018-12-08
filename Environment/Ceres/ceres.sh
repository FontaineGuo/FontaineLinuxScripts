# Cmake
sudo apt-get install cmake
# google-glog + gflags
sudo apt-get install libgoogle-glog-dev
# BLAS & LAPAC
sudo apt-get install libatlas-base-dev
# Eigen3
sudo apt-get install libeigen3-dev
# SuiteSparse和CXSparse(可选)
# - 如果您希望将Ceres构建为*static*库(默认)，则可以在Ubuntu主包repository中使用SuiteSparse包
sudo apt-get install libsuitesparse-dev
# - 但是，如果您要将Ceres构建为* shared *库，则必须添加以下PPA：
# sudo add-apt-repository ppa:bzindovic /suitesparse-bugfix-1319687
# sudo apt-get update
# sudo apt-get install libsuitesparse-dev

git clone https://github.com/ceres-solver/ceres-solver.git

cd ceres-solver
git checkout 1.14.0
mkdir build
cd build

# if you want to install the ceres in the default location
cmake -DCMAKE_BUILD_TYPE=RELEASE ..
make -j4
sudo make install

# if you want to install the ceres in the custom location
# cmake -DCMAKE_BUILD_TYPE=RELEASE \
#       -DCMAKE_INSTALL_PREFIX=/custompath ..
# make -j4 
# make install
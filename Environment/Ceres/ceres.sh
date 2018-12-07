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

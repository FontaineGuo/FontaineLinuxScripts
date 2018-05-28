sudo apt-get update

# 1. install cmake-qt-gui
echo "Install cmake-qt-gui"
sudo apt-get install cmake-qt-gui

# 2. install cmake
echo "Install tree"
sudo apt-get install tree


# 3. install python
echo "Install python"
sudo apt-get update
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip3 install -U pip numpy
sudo pip3 install virtualenvwrapper virtulenv numpy scipy matplotlib scikit-image scikit-learn ipython

# 4. install tsocks
echo "Install tsocks"
sudo apt-get install tsocks

# 5. install virtualenvwrapper virtulenv
echo "install virtualenvwrapper virtulenv"
sudo pip3 install virtualenvwrapper virtulenv


# 6. software-properties-common
sudo apt-get install software-properties-common

# 7.install lib
sudo apt-get -y install libboost-dev
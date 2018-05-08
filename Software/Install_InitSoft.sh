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
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy python3-pip
sudo pip3 install virtualenvwrapper virtulenv numpy scipy matplotlib scikit-image scikit-learn ipython

# 4. install tsocks
echo "Install tsocks"
sudo apt-get install tsocks


# 5. software-properties-common
apt-get install software-properties-common
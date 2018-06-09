sudo apt-get update

# 1. install cmake-qt-gui
echo "Install cmake-qt-gui"
sudo apt-get install cmake cmake-qt-gui

# 2. install cmake
echo "Install tree"
sudo apt-get install tree


# 3. install python
echo "Install python"
sudo apt-get update
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip3 install -U pip numpy
sudo -H pip2 install -U pip numpy
sudo pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython

# 4. install tsocks
echo "Install tsocks"
sudo apt-get install tsocks

# 5. install virtualenvwrapper virtulenv
echo "install virtualenvwrapper virtulenv"
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


# 6. software-properties-common
sudo apt-get install software-properties-common

# 7. svn
sudo apt-get install -y subversion


# 7.install lib
sudo apt-get -y install libboost-dev


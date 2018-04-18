sudo apt-get install virtualenv
sudo pip install virtulenv

sudo apt-get install virtualenvwrapper virtualenv
sudo pip install virtualenvwrapper virtulenv

######################################
# 当你需要使用Python2开发项目时，建立一个Python2的虚拟环境：
# $ mkvirtualenv -p /usr/bin/python2 env27
# 当你需要Python3开发时：
# $ mkvirtualenv -p /usr/bin/python3.4 env34

# $ workon env27  # 进入Python2环境
# $ workon env34  # 进入Python3环境



# 对于virtualenvwrapper的配置：

# 代码如下：

######################################
# iexport WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
######################################

# 将上面的配置添加到 ~/.bashrc 的末尾，然后将下面的命令运行一次：
# source ~/.bashrc
######################################
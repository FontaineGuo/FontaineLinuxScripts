sudo pip3 install virtualenvwrapper virtulenv

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
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
######################################

# 将上面的配置添加到 ~/.bashrc 的末尾，然后将下面的命令运行一次：
# source ~/.bashrc
######################################


############ For Python 3 ############
# create virtual environment
# mkvirtualenv facecourse-py3 -p python3
# workon facecourse-py3
  
# # now install python libraries within this virtual environment
# pip install numpy scipy matplotlib scikit-image scikit-learn ipython
  
# # quit virtual environment
# deactivate
######################################

######################################
# 用法
# rmvirtualenv ENV：删除运行环境ENV

# mkproject mic：创建mic项目和运行环境mic

# mktmpenv：创建临时运行环境

# lsvirtualenv: 列出可用的运行环境

# lssitepackages: 列出当前环境安装了的包
######################################
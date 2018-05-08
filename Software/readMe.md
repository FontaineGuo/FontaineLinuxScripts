# Software use guide
## Catalogue
- [tree](#tree)
- [tsocks](#tsocks)
- [virtualenvwrapper virtulenv](#virtualenvwrapper&virtulenv)

### tree
查看不同级别子目录和文件使用"tree -L 1 "这个命令，只查看当前第一级的目
录。和文件使用"tree -L 2 "

这个命令，只查看当前第二级的目录和文件使用"tree -L N "这个命令，只查看当前第N级的目录和文件。

### tsocks
```
vi /etc/tsocks.conf
server = 127.0.0.1
server_type = 5
server_port = 1080
sudo tsocks apt-get update
tsocks wget .....
```

### virtualenvwrapper&virtulenv

先查询python的路径
```
whereis python
```

当你需要使用Python2开发项目时，建立一个Python2的虚拟环境：
```
$ mkvirtualenv -p /usr/bin/python2 env27
```
当你需要Python3开发时：
```
$ mkvirtualenv -p /usr/bin/python3.4 env34
```
```
$ workon env27  # 进入Python2环境
$ workon env34  # 进入Python3环境
```


对于virtualenvwrapper的配置：

代码如下：

```
sudo vi ~/.bashrc
### 添加
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

### 本地样例
export WORKON_HOME=/home/fontaineguo/.virtualenvs
export PROJECT_HOME=/home/fontaineguo/Devel
source /usr/local/bin/virtualenvwrapper.sh

### 如果找不到virtualenvwrapper模组，修改路径
```
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.5 （以此类推每个版本）
```
### 执行
source ~/.bashrc
```
#### For Python 3
```
# create virtual environment
mkvirtualenv facecourse-py3 -p python3
workon facecourse-py3
```
now install python libraries within this virtual environment
```
pip install numpy scipy matplotlib scikit-image scikit-learn ipython
```
quit virtual environment
```
deactivate
```

用法
rmvirtualenv ENV：删除运行环境ENV

mkproject mic：创建mic项目和运行环境mic

mktmpenv：创建临时运行环境

lsvirtualenv: 列出可用的运行环境

lssitepackages: 列出当前环境安装了的包

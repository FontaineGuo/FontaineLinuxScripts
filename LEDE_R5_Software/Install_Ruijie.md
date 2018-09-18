## How to install Ruijie in Lede_r5 system



1、进入LEDE固件管理界面的系统—管理器—SSH访问，然后勾选下列内容后点击右下角的保存应用按钮

2、打开 PuTTY 然后填写路由器IP连接类型选择 SSH，然后点击下方的打开即可连接到路由器输入账号密码。

3、LEDE固件的默认账号为root、密码为你自己设置的，Linux下输入密码不显示因此输入完成直接回车即可。

4、依次执行以下命令分别用于进入临时文件夹、下载组件包、解压组件包、安装组件包等等，必须按顺序：\


```
cd /tmp

wget -c https://rawgit.com/FontaineGuo/FontaineLinuxScripts/master/LEDE_R5_Software/BCR47_53XX.zip

// 解压刚刚下载的锐捷认证压缩包

unzip BCR47_53XX.zip

// 进入解压后的文件夹

cd /tmp/mentohust-bcr47XX-53XX-arm

// 依次安装锐捷认证的依赖组件

opkg install libpcap_1.8.1-1_arm_cortex-a9.ipk

// 安装主程序 MentoHUST 

opkg install mentohust_0.3.1-2_arm_cortex-a9.ipk

// 安装 MentoHUST 的图形化界面

opkg install luci-app-mentohust_2.1-1_all.ipk

// 最后安装中文语言包

opkg install luci-i18n-mentohust-zh-cn_2.1-1_all.ipk
```
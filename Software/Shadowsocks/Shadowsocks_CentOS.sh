yum install m2crypto python-setuptools
yum install firewalld
easy_install pip
pip install shadowsocks
echo "*********************************************************"
echo "*                                                       *"
echo "*                    SS for centOS                      *" 
echo "*                                                       *"
echo "*                                                       *"
echo "*********************************************************"
echo "请输入加密方式 (推荐aes-256-cfb)"
read method
echo "1：输入你想创建的端口数量"
read usrNum

# config single user
if [ "${usrNum}" -eq 1 ]
then
echo "请输入服务器端口:"
read serverport
echo "请输入密码:"
read shadowsockspwd
# # test create config json
# cat > ./shadowsocks.json<<-EOF
# {
# 	"server":"::",
# 	"server_port":${serverport},
# 	"local_address": "127.0.0.1",
# 	"local_port":1080,
# 	"password":${shadowsockspwd},
# 	"timeout":300,
# 	"method":"${method}",
# 	"fast_open": false
# }
# EOF

# Config shadowsocks
cat > /etc/shadowsocks.json<<-EOF
{
	"server":"::",
	"server_port":${serverport},
	"local_address": "127.0.0.1",
	"local_port":1080,
	"password":"${shadowsockspwd}",
	"timeout":300,
	"method":"${method}",
	"fast_open": false
}
EOF
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-port=${serverport}/tcp
firewall-cmd --reload
nohup ssserver -c /etc/shadowsocks.json &
echo "配置完成"
fi

# config mutiple user port_password
if [ "${usrNum}" -gt 1 ]
then
i=0
declare -a ports_array
declare -a psw_array
port_password=""
while((${i} < ${usrNum}))
do
	echo "——————————请输入第$((${i}+1))个端口号——————————"
	read port
	echo "——————————请输入第$((${i}+1))个端口的密码——————————"
	read password
	ports_array[${i}]=${port}
	psw_array[${i}]=${password}
	echo "第$((${i}+1))个端口号${ports_array[${i}]}，密码为：${psw_array[${i}]}"
	if [ "${i}" -eq 0 ]
	then
		port_password="\"${ports_array[${i}]}\":\"${psw_array[${i}]}\""
	else
		port_password="$port_password, \"${ports_array[${i}]}\":\"${psw_array[${i}]}\""
	fi
	i=$(expr $i + 1)
done
port_password="{$port_password}"
echo $port_password
#test script
# cat > ./shadowsocks.json<<-EOF
# {
#   "server":"::",
#   "local_address":"127.0.0.1",
#   "local_port":1080,
#   "port_password": ${port_password},
#   "timeout":600,
#   "method":"${method}"
# }
# EOF


#Config shadowsocks
cat > /etc/shadowsocks.json<<-EOF
{
  "server":"::",
  "local_address":"127.0.0.1",
  "local_port":1080,
  "port_password": ${port_password},
  "timeout":600,
  "method":"${method}"
}
EOF
systemctl start firewalld
i=0
# open the firewall port
while((${i} < ${usrNum}))
do
	firewall-cmd --permanent --zone=public --add-port=${ports_array[${i}]}/tcp
	i=$(expr $i + 1)
done
firewall-cmd --reload
nohup ssserver -c /etc/shadowsocks.json &
echo "配置完成"
fi



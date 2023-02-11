#!/bin/bash
# Laravel Installer
# Script by Juan
# 
# Illegal selling and redistribution of this script is strictly prohibited
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#


clear
#fonts color
Green="\033[32m"
Red="\033[31m"
Yellow="\033[33m"
GreenBG="\033[42;37m"
Purple="\033[0;35m"
RedBG="\033[41;37m"
Font="\033[0m"
PurpleBG="\033[45;37m"
YellowBG="\033[43m"
read -rp "Please Enter Script Password：" menu_num1
if [ $menu_num1 == 'markkingishere' ]
then

# Fixing Squid Proxy
apt-get -y install squid
function fixsquid() {
    cat <<'EOFsquid' > /etc/squid/squid.conf
acl VPN dst 127.0.0.1/32
http_access allow VPN
http_access deny all
http_port 0.0.0.0:8000
http_port 0.0.0.0:8080
acl bonv src 0.0.0.0/0.0.0.0
no_cache deny bonv
dns_nameservers 1.1.1.1 1.0.0.1
visible_hostname localhost
EOFsquid

}
fixsquid

function fixedovpn() {
bash -c "sed -i "/ncp-disable/d" /etc/openvpn/server/*.conf;systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p"
}
fixedovpn


service squid restart
service openvpn restart
history -c
clear

echo "THIS SCRIPT IS NOT FOR SALE "
echo "OPENVPN AND SQUID PROXY FIXED "
echo "MARK KING DURAN SCRIPT"

 
 # Clearing all logs from installation
 rm -rf /root/.bash_history && history -c && echo '' > /var/log/syslog

else
clear
     echo -e "${RedBG}Wrong Password! Fuckyou Shit ${Font}"

fi
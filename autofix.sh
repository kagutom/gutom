#!/bin/bash
# Laravel Installer
# Script by Juan
# 
# Illegal selling and redistribution of this script is strictly prohibited
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

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
echo "MICROSSH.COM "
#!/bin/bash
echo "Checking Vps"
curl -o.html https://icanhazip.com
sleep 0.5
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )
REGION=$(curl -s ipinfo.io/region )
KATA=$(curl -s rdpvps.me/kata.php )
TIME=$(curl -s Ipinfo.io/timezone )
LOC=$(curl -s Ipinfo.io/loc )
IP=$(wget -qO- icanhazip.com);
domain=$(cat /var/lib/premium-script/ipvps.conf)
echo Script AutoCreate Akun SSH dan OpenVPN by JOMBLOSSH
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank you for using our service"
echo -e "Informasi Akun SSH & OpenVPN"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "CITY           : $CITY $LOC"
echo -e "TIMEZONE       : $TIME"
echo -e "ISP            : $ISP"
echo -e "COUNTRY        : $COUNTRY"
echo -e "REGION         : $REGION"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "IP Server      : $IP"
echo -e "Host           : $domain"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 143, 109"
echo -e "SSL/TLS        : 443, 222, 777"
echo -e "WS-SSH         : 2082"
echo -e "WS-OVPN        : 2086"
echo -e "Port Squid     : 3128, 8080 (limit to IP SSH)" 
echo -e "OpenVPN        : TCP 1194 http://$IP:81/client-tcp-1194.ovpn"
echo -e "OpenVPN        : UDP 2200 http://$IP:81/client-udp-2200.ovpn"
echo -e "OpenVPN        : SSL 992 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "badvpn         : 7100, 7200, 7300"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━━━━Payload Edukasi━━━━━━"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━SETTING SSH WS HC━━━━━━"
echo -e "me.ruangguru.com:2082@$Login:$Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Expired On     : $exp"
echo -e "Thanks you for order :)"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "~ $KATA"
echo -e ""
echo -e "Script by JOMBLOSSH"

#Firewall settings

#Server
firewall-cmd --permanent --add-port=5665/tcp
firewall-cmd --permanent --add-port=5665/udp
firewall-cmd --reload
#Firewall settings

#Server
firewall-cmd --permanent --add-port=5665/tcp
firewall-cmd --permanent --add-port=5665/udp
firewall-cmd --reload

#Client
firewall-cmd --permanent --zone=public --add-port=5665/tcp
firewall-cmd --permanent --zone=public --add-port=5665/udp
firewall-cmd --reload

#Server
icinga2 node wizzard
#Set 'n' for master
#Leave 'name' as is and Bind host and Bind Port empty
systemctl restart icinga2

#Client
rpm -i http://packages.icinga.com/epel/7/release/noarch/icinga-rpm-release-7-2.el7.centos.noarch.rpm
yum install icinga2
yum install http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
yum install nagios-plugins-all

icinga2 node wizzard
#Set 'y' for satelitegfgfg
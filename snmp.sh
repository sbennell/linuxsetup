apt-get install sudo -y
sudo apt-get install snmpd -y
sudo mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.old
sudo su -
sudo cat > /etc/snmp/snmpd.conf << EOF
# Change public below to your preferred SNMP community string
com2sec readonly  default         public

group MyROGroup v2c        readonly
view all    included  .1                               80
access MyROGroup ""      any       noauth    exact  all    none   none

sysLocation Shed, Rack
sysContact Stewart Bennell <server@lab-network.xyz>

#Distro Detection
extend .1.3.6.1.4.1.2021.7890.1 distro /usr/bin/distro
EOF
exit
sudo curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro
sudo chmod +x /usr/bin/distro
sudo service snmpd restart

#Edit sysLocation and sysContact if needed

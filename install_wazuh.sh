#!/bin/bash


#Import Wazuh repo
rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH

cat > /etc/yum.repos.d/wazuh.repo <<\EOF
[wazuh_repo]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=Wazuh repository
baseurl=https://packages.wazuh.com/3.x/yum/
protect=1
EOF

#Install Wazuh manager
yum install wazuh-manager -y

#Install Wazuh API
curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

yum install nodejs -y

yum install wazuh-api -y

#Disable Wazuh repo
sed -i "s/^enabled=1/enabled=0/" /etc/yum.repos.d/wazuh.repo
#!/usr/bin/env bash


sudo curl -sSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo sysctl -w vm.max_map_count=262144
sudo curl -so /vagrant/docker-compose.yml https://raw.githubusercontent.com/wazuh/wazuh-docker/v3.7.2_6.5.4/docker-compose.yml
cd /vagrant
chmod 777 /usr/local/bin/docker-compose
docker-compose up -d
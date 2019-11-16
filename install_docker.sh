#!/usr/bin/env bash

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum makecache fast

sudo yum install -y docker-ce

sudo systemctl start docker

sudo systemctl enable docker

mkdir -p /mnt/data/redis

mkdir -p /mnt/data/redis-data

mkdir -p /mnt/data/mongo

mkdir -p /mnt/logs

sudo usermod -aG docker $USER

chmod -Rf 777 /var/run/docker.sock

sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.119.0/24" port protocol="tcp" port="8089" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.36.0/24" port protocol="tcp" port="8089" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.38.0/24" port protocol="tcp" port="8089" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.56.0/24" port protocol="tcp" port="8089" accept' --permanent

sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.119.0/24" port protocol="tcp" port="8090" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.36.0/24" port protocol="tcp" port="8090" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.38.0/24" port protocol="tcp" port="8090" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.56.0/24" port protocol="tcp" port="8090" accept' --permanent

sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.119.0/24" port protocol="tcp" port="27017" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.36.0/24" port protocol="tcp" port="27017" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.38.0/24" port protocol="tcp" port="27017" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.56.0/24" port protocol="tcp" port="27017" accept' --permanent

sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.119.0/24" port protocol="tcp" port="7000-7005" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.36.0/24" port protocol="tcp" port="7000-7005" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.38.0/24" port protocol="tcp" port="7000-7005" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.56.0/24" port protocol="tcp" port="7000-7005" accept' --permanent


sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.119.0/24" port protocol="tcp" port="8081-8084" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.36.0/24" port protocol="tcp" port="8081-8084" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.38.0/24" port protocol="tcp" port="8081-8084" accept' --permanent
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="183.87.56.0/24" port protocol="tcp" port="8081-8084" accept' --permanent


sudo firewall-cmd --reload
sudo firewall-cmd --list-all
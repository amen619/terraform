apt-get update
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
touch /etc/apt/sources.list.d/saltstack.list
cd /etc/apt/sources.list.d/
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> saltstack.list
apt-get update
apt-get -y install salt-master

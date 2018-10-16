#!/bin/bash
#instalar dependencias de la aplicación
#
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Updating Server"
apt-get update && apt-get upgrade
apt-get update -y  && apt-get upgrade -y 
echo "Instaling MySQL"
apt-get install mysql-server -y  
echo "Enter MySQL Password"
mysql_secure_installation
echo "installing dependencies"
echo "installing git"
apt-get install git -y  
echo "installing cmake"
apt-get install cmake -y  
echo "installing python-pip"
apt-get install python-pip -y  
echo "installing libmysqlclient-dev"
apt-get install libmysqlclient-dev -y  
echo "installing python-mysqldb"
apt-get install python-mysqldb -y  
echo "installing libvirt-bin"
apt-get install libvirt-bin -y 
echo "installing devscripts"
apt-get install devscripts -y 
echo "installing libgcrypt11-dev"
apt-get install libgcrypt11-dev -y 
echo "installing libcurl4-openssl-dev"
apt-get install libcurl4-openssl-dev -y 
echo "installing libcurl4-gnutls-dev librtmp-dev"
apt-get install libcurl4-gnutls-dev librtmp-dev -y 
echo "installing libssl-dev libffi-dev python-dev"
apt-get install libssl-dev libffi-dev python-dev -y 
apt-get install openssl libssl-dev -y 
echo "installing build-essential tcl"
apt-get install build-essential tcl -y 
echo "installing autoconf"
apt-get install autoconf -y 
echo "installing docbook-xml"
apt-get install docbook-xml -y 
echo "Creating Python virtual enviroment"
pip install --upgrade pip
pip install virtualenv
cd databases
echo "Enter the MySQL password"
mysql -u root -p < db.sql


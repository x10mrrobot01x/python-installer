#!/bin/sh
# Script to install python1.6.1 since python is now deprecated

# Packages install check
pkg1=wget
pkg2=gunzip
pkg3=make
pkg4=tar

# Checks to see whether youre using apt or yum
apt=`command -v apt-get`
yum=`command -v yum`

if [ -n "$apt" ]; then
  apt-get update -y
  apt-get install $pkg1 $pkg2 $pkg3 $pkg4 -y

elif [ -n "$yum" ]; then
  yum update -y
  yum -y install $pkg1 $pkg2 $pkg3 $pkg4
  yum -y update $pkg4

else
  echo "Err: no path to apt-get or yum" >&2;

fi
# Install gunzip from python.org f
wget https://legacy.python.org/download/releases/1.6.1/Python-1.6.1.tar.gz
cd /root/Downloads/
gunzip Python-1.6.1.tar.gz
tar -xvf Python-1.6.1.tar
cd Python-1.6.1
./configure
make
make install
cd
python --version

#!/bin/bash

if [ -f /etc/redhat-release ]; then
  var1=$(grep -o CentOS /etc/redhat-release)
else
  var1=$(awk -F= '$1=="NAME" {gsub("\"", "", $2); print $2}' /etc/os-release)
fi

echo var1: $var1
sleep 5

sudo mkdir -p /usr/lib/mito
sudo cp -v /vagrant/lib/libgcode-lexer.so /lib64/
sudo ln -s /lib64/libgcode-lexer.so /usr/lib/mito/
tar -xvzf /vagrant/mitoPrinter_v7.tar.gz -C $HOME
cd $HOME/mitoPrinter
cp -vr /vagrant/lib/*.h ./

if [ "$var1" = "Debian GNU/Linux" ]; then
  echo -e "Debian"
  sudo apt-get -y install qt5-default
  sudo apt-get -y install libglew-dev freeglut3-dev
  qmake mitoPrinter.pro
  make
if [ "$var1" = "Raspbian GNU/Linux" ]; then
  echo -e "Debian"
  sudo apt-get -y install qt5-default
  sudo apt-get -y install libglew-dev freeglut3-dev
  qmake mitoPrinter.pro
  make
elif [ "$var1" = "CentOS" ]; then
  echo -e "CentOS"
  sudo yum -y install -y python-lxml libselinux-python vim unzip mc htop git
  sudo yum -y install -y qt5-qtbase-devel gcc-c++
  sudo yum -y install glew-devel freeglut-devel
  qmake-qt5 mitoPrinter.pro
  make
else
  echo -e "Unknouwn distributiv"
fi

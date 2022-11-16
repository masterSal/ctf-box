#!/bin/bash

# Updates
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install unzip
sudo apt-get -y install foremost

# install git
sudo apt install -y git

# Install Binjitsu
sudo apt-get -y install python2.7 python-pip python-dev git
sudo pip install --upgrade git+https://github.com/binjitsu/binjitsu.git

cd
mkdir tools
cd tools

# Install pwndbg
git clone https://github.com/zachriggle/pwndbg
echo source `pwd`/pwndbg/gdbinit.py >> ~/.gdbinit

# Capstone for pwndbg
git clone https://github.com/aquynh/capstone
cd capstone
git checkout -t origin/next
sudo ./make.sh install
cd bindings/python
sudo python3 setup.py install # Ubuntu 14.04+, GDB uses Python3

# pycparser for pwndbg
sudo pip3 install pycparser # Use pip3 for Python3

# Install radare2
git clone https://github.com/radare/radare2
cd radare2
./sys/install.sh

# Install binwalk
cd 
git clone https://github.com/devttys0/binwalk
cd binwalk
sudo python setup.py install

# Install Firmware-Mod-Kit
#sudo apt-get -y install git build-essential zlib1g-dev liblzma-dev python-magic
#cd ~/tools
#wget https://firmware-mod-kit.googlecode.com/files/fmk_099.tar.gz
#tar xvf fmk_099.tar.gz
#rm fmk_099.tar.gz
#cd fmk_099/src
#./configure
#make

# Uninstall capstone
sudo pip2 uninstall capstone -y

# Install correct capstone
cd ~/tools/capstone/bindings/python
sudo python setup.py install

# Personal config
# ....

# Install Angr
cd /home/vagrant
sudo apt-get -y install python-dev libffi-dev build-essential virtualenvwrapper
sudo pip install virtualenv
virtualenv angr
source angr/bin/activate
pip install angr --upgrade

# install John the ripper
cd /home/vagrant/tools
git clone https://github.com/openwall/john.git

# install dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# install gobuster
sudo apt -y install gobuster

# install searchsploit
# git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database
# ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
# cp -n /opt/exploit-database/.searchsploit_rc ~/

# install nmap
sudo apt install nmap -y

# install openvpn
sudo apt install openvpn -y

# install msf
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
